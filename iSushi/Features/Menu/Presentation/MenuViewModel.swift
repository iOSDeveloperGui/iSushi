//
//  MenuViewModel .swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation
import Combine

@MainActor
class MenuViewModel: ObservableObject {
    @Published var dishes: [Dish] = []
    @Published var isLoading: Bool = false
    @Published var selectedCategory: String? = nil
    @Published var selectedDish: Dish?
    @Published var showDetailSheet = false
    @Published var errorMessage: String? = nil
    
    private let fetchMenuUseCase: FetchMenuUseCaseProtocol
    
    var categories: [String] {
        Array(Set(dishes.map { $0.category })).sorted()
    }
    
    var filteredDishes: [Dish] {
        guard let category = selectedCategory else{
            return dishes
        }
        return dishes.filter { $0.category == category}
    }
    
    init(useCase: FetchMenuUseCaseProtocol) {
        self.fetchMenuUseCase = useCase
    }

    func loadMenu() async {
        isLoading = true
        errorMessage = nil
        
        do{
            let fetchedDishes = try await fetchMenuUseCase.execute()
            self.dishes = fetchedDishes
            self.selectedCategory = self.categories.first
            
            print("Successfully fetched: \(dishes.count) dishes")
        } catch{
            self.errorMessage = "Failed to load menu: \(error.localizedDescription)"
            print("Error fetching menu: \(error)")
        }
        isLoading = false
    }
    
    func selectDish(_ dish: Dish){
        self.selectedDish = dish
        self.showDetailSheet = true
    }
}
