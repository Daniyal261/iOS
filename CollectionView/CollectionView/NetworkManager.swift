//
//  NetworkManager.swift
//  CollectionView
//
//  Created by Raja Adeel Ahmed on 7/3/20.
//  Copyright © 2020 Raja Adeel Ahmed. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    // MARK: -

    let baseURL: String
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(baseURL: "https://httpbin.org/")

        // Configuration
        // ...

        return networkManager
    }()



    // Initialization

    private init(baseURL: String) {
        self.baseURL = baseURL
    }

    // MARK: - Accessors

    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
    func loadImage(completion: @escaping (Any?) -> Void) {
        AF.request( "\(self.baseURL)image/jpeg").responseJSON { response in
            completion(response.data)
        }
    }
    
    
    let closure = { (name:String) -> String in
        return "Hello, \(name)!"
    }
    
    func getName(name:String) -> String {
        return ""
    }
    
    func fetchFilms(completion: @escaping (Any?) -> Void) {
      // 1
      let request = AF.request("https://swapi.dev/api/films")        
        request.responseDecodable(of: Films.self) { (response) in
          guard let films = response.value else { return }
            completion(films)
          print(films.all[0].title)
        }
    }
}
