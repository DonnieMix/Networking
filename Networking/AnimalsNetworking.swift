//
//  CatsNetworking.swift
//  
//
//  Created by Kyrylo Derkach on 26.05.2023.
//

import Foundation

public class AnimalsNetworking {
    
    public static func getCats(amount: Int, _ completionHandler: @escaping ([Animal]?, Error?) -> Void) {
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=\(amount)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let catsList = try decoder.decode([Animal].self, from: data)
                completionHandler(catsList, nil)
            } catch let parseErr {
                completionHandler(nil, parseErr)
            }
        })
        task.resume()
    }
    
    public static func getDogs(amount: Int, _ completionHandler: @escaping ([Animal]?, Error?) -> Void) {
        let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=\(amount)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let catsList = try decoder.decode([Animal].self, from: data)
                completionHandler(catsList, nil)
            } catch let parseErr {
                completionHandler(nil, parseErr)
            }
        })
        task.resume()
    }
    
}
