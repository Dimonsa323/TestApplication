//
//  ImageView.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.12.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(from url: String) {
        
        guard let url = URL(string: url) else {
            image = UIImage(systemName: "person.fill")
            return
        }
        
        if let cachedImage = getCachedImage(url: url) {
            image = cachedImage
            return
        }
        
        NetworkingService.loadAsyncImage(url: url) { data, response  in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            self.saveDataToCash(with: data, response: response)
        }
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let response = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: response.data)
        }
        
        return nil
    }
    
    private func saveDataToCash(with data: Data, response: URLResponse) {
        guard let urlResponse = response.url else {return}
        let cachedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
