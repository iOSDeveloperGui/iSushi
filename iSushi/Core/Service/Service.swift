//
//  Dish.swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation

class Service{
    private let dataService: MenuRepositoryProtocol
    
    init(dataService: MenuRepositoryProtocol){
        self.dataService = dataService
    }
    
    func getMenuList() async throws -> [Dish] {
        do{
            return try await dataService.fetchMenu()
        }
        
    }
}
