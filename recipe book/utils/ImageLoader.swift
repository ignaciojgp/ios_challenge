//
//  ImageLoader.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class ImageLoader: NSObject {
    
    public static let intance = ImageLoader()
    
    private override init() {
    }
    
    let imageCache = NSCache<NSString, UIImage>()

    func imageLoader(urlString:String, placeHolder:UIImageView) -> URLSessionDataTask?{
        
        
        if let image = imageCache.object(forKey: urlString as NSString){
            placeHolder.image = image
            return nil
        }
        
        
        guard let url = URL(string: urlString) else {
            //throw an error
            return nil
        }
        
        let urlRequest = URLRequest(url: url )
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let imageData = data{
                let image = UIImage(data: imageData)

                self.imageCache.setObject(image!, forKey: urlString as NSString)
                
                DispatchQueue.main.async {
                    placeHolder.image = image
                    placeHolder.setNeedsDisplay()

                }
                
            }
            
        }
        
        task.resume()
        
        return task
    }
}
