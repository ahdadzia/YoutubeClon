//
//  DetailViewController.swift
//  YoutubeClon
//
//  Created by Ahda  Dzia Ulhaq on 19/03/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // kita bersihkan hal" berikut
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // cek ada video nya gk
        guard video != nil else {
            return
        }
        
        // membuat embed url (https://youtube.com/embed/ + videoId)
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // ngeload video ke webView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // ngeset title
        titleLabel.text = video!.title
        
        // ngeset date
        let df = DateFormatter()
        df.dateFormat = "EEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        // ngeset description
        textView.text = video!.description
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
