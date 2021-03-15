//
//  Model.swift
//  YoutubeClon
//
//  Created by Ahda  Dzia Ulhaq on 15/03/21.
//

import Foundation

class Model{
    
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
        }
        
        // mulai bekerja
        dataTask.resume()
        
    }
}
