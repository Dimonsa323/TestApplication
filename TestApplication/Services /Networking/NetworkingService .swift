//
//  NetworkingService .swift
//  TestApplication
//
//  Created by Дима Губеня on 09.11.2022.
//

import Foundation
import UIKit

protocol NetwotkingServiceProtocol {
    func getModel(type: MenuActions, closure: @escaping ([Hits]) -> ())
}

class NetworkingService {
    func getModel(type: MenuActions, closure: @escaping ([Hits]) -> ()) {
        
        guard let url = URL(string: "https://edamam-recipe-search.p.rapidapi.com/search?q=\(type.partURL)") else {
            return
        }
        
        let headers = [
            "X-RapidAPI-Key": "d48b37f797msh914f92f5efbf2b8p18795ejsn2d67a777e5d2",
            "X-RapidAPI-Host": "edamam-recipe-search.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
            }
            let decoder = JSONDecoder()
            do {
                if let data {
                    let menu = try decoder.decode(FoodMenu.self, from: data)
                    print(menu)
                    DispatchQueue.main.async {
                        closure(menu.hit)
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

extension NetworkingService: NetwotkingServiceProtocol {
    
}
