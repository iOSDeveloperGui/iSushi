//
//  Dish.swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation

class DataService: MenuRepositoryProtocol{

    func fetchMenu() async throws -> [Dish]{
        guard let url = URL(string: "http://127.0.0.1:8000/menu.json") else{
            throw URLError(.badURL)
        }
                
        var request = URLRequest(url: url)
        request.cachePolicy = . reloadIgnoringLocalAndRemoteCacheData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        if let jsonString = String(data: data, encoding: .utf8){
            print("Raw JSON received: \(jsonString)")
        }
        
        do{
            let decodedMenu = try JSONDecoder().decode([Dish].self, from: data)
            return decodedMenu
        }
    }
    
}
