//
//  Model.swift
//  YoutubeClon
//
//  Created by Ahda  Dzia Ulhaq on 15/03/21.
//

import Foundation

protocol modelDelegate {
    func videosFetched(_ videos:[Video])
    
}

class Model{
    
    var delegate: modelDelegate?
    
    // buat fungsi untuk ngambil data dari Youtube API
    func getVideo(){
        // simpan url ke dalam variabel
        let url = URL(string: Constants.API_URL)
        
        // kita cek url nya kosong tidak
        guard url != nil else {
            return
        }
        
        // mendapatkan URLSession dari object
        let session = URLSession.shared
        
        // mendapatkan dara dari URLSession
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
            // cek jika ada error
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing the data into video project
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        
                        //calling "videosFetched" method of delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
                dump(response)
            }
            catch {
                
            }
            
        }
        
        // mulai bekerja
        dataTask.resume()
        
    }
}
