//
//  ViewController.swift
//  YoutubeClon
//
//  Created by Ahda  Dzia Ulhaq on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, modelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        model.getVideo()
    }
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // configure the cell with data
        // get title for video in question
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // make a variable that selected video
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // make a variable for detail viewController
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedVideo
    }
}

