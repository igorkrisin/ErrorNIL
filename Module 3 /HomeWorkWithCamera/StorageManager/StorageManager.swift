//
//  StorageManager.swift
//  HomeWorkWithCamera
//
//  Created by Игорь Крысин on 20.07.2024.
//

import Foundation

class StorageManager {
    func getPath() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
    }
    
    func saveImage(folder: String, imageName: String, image: Data) {
        var url = getPath()
        url.append(path: "notes/\(folder)")
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        url.append(path: "\(imageName)")
        
        try? image.write(to: url)
    }
    
    
    func loadImage(folder: String, imageName: String) -> Data? {
        var url = getPath()
        url.append(path: "notes/\(folder)")
        url.append(path: "\(imageName)")
        
         return try? Data(contentsOf: url)
    }
}
