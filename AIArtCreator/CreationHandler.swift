//
//  CreationHandler.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 15.11.2022.
//

import Foundation
import UIKit
import Photos


class CreationHandler {
    
    //Static let
    
    func fetchArtFromAPI(creation: Creation, completion: @escaping (_ resultImage: UIImage?) -> Void) {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "private key",
            "X-RapidAPI-Host": "dezgo.p.rapidapi.com"
        ]

        let postData = NSMutableData(data: "prompt=\(creation.prompt), \(creation.style.categoryName), highly-detailed masterpiece trending HQ".data(using: String.Encoding.utf8)!)
        postData.append("&width=512".data(using: String.Encoding.utf8)!)
        postData.append("&steps=50".data(using: String.Encoding.utf8)!)
        postData.append("&guidance=7.5".data(using: String.Encoding.utf8)!)
        postData.append("&height=512".data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string: "https://dezgo.p.rapidapi.com/text2image")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 20.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            if error != nil {
                completion(nil)
            } else {
                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        })
        dataTask.resume()
    }
}

