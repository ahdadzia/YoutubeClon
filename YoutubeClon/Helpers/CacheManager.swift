//
//  CacheManager.swift
//  YoutubeClon
//
//  Created by Ahda  Dzia Ulhaq on 18/03/21.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache (_ url: String, _ data: Data? ) {
        
        // store the image data and use the url as key
        cache[url] = data
        
    }
    
    static func getVideoCached(_ url: String) -> Data? {
        
        // try to get the data for the specified url
        return cache[url]
    }
    
    
}
