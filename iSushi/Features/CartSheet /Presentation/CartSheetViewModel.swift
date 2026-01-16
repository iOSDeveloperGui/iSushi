//
//  CartSheetViewModel.swift
//  iSushi
//
//  Created by iOS Developer on 30/12/25.
//

import SwiftUI
import Combine

@MainActor
class CartSheetViewModel: ObservableObject{
    @Published var items: [CartItem] = []
    @Published var isSheetPresented: Bool = false
    @Published var isShowingCheckout: Bool = false 
    @Published var isProcessing: Bool = false
    @Published var showSuccessView: Bool = false
    
    private let checkoutUseCase: CheckoutUseCaseProtocol
    
    init(checkoutUseCase: CheckoutUseCaseProtocol){
        self.checkoutUseCase = checkoutUseCase
    }
    
    var totalOrder: Double{
        items.reduce(0) { $0 + $1.subTotal  }
    }
    
    func addToCart(dish: Dish){
        if let index = items.firstIndex(where: { $0.dish.id == dish.id}){
            items[index].quantity += 1
        } else{
            items.append(CartItem(dish: dish, quantity: 1))
        }
    }
    
    func removeItem(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    
    func checkout() async{
        isProcessing = true
        
        do{
            try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        } catch{
            print("Error: \(error.localizedDescription)")
        }
        
        isProcessing = false
        
        withAnimation(.spring()) {
            self.showSuccessView = true
        }
        items = []
    }
}
