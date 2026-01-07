//
//  MenuViewModel .swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation
import Combine

class FetchMenuUseCase: FetchMenuUseCaseProtocol{
    private let repository: MenuRepositoryProtocol
    
    init(repository: MenuRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Dish] {
        let dtos = try await repository.fetchMenu()
        
        return dtos.map { dto in
            Dish(id: dto.id, name: dto.name, description: dto.description, price: dto.price, category: dto.category, imageUrl: dto.imageUrl)
        }
    }
    

}
