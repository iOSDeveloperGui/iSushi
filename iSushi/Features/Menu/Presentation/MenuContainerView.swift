//
//  MenuContainerView.swift
//  iSushi
//
//  Created by iOS Developer on 30/12/25.
//

import SwiftUI

struct MenuContainerView: View {
    @StateObject var menuVM: MenuViewModel
    @StateObject var cartVM = CartSheetViewModel(checkoutUseCase: CheckoutUseCase())
    
    var body: some View {
        NavigationSplitView{
            List(selection: $menuVM.selectedCategory){
                Text("All Items")
                    .tag(String?.none)
                    .bold()
                
                ForEach(menuVM.categories, id: \.self){ category in
                    Text(category)
                        .tag(Optional(category))
                }
            }
            .navigationTitle("Categories")
            
        } content: {
            DishContentView(dishes: menuVM.filteredDishes, selectedDish: menuVM.selectedDish){ dish in
                menuVM.selectedDish = dish
                menuVM.showDetailSheet = true
            }
            .environmentObject(cartVM)
            .task{
                await menuVM.loadMenu()
            }
            
        } detail: {
            CartSidePanelView(viewModel: cartVM)
        }
        .navigationSplitViewStyle(.balanced)
        .sheet(isPresented: $menuVM.showDetailSheet, onDismiss: {
            menuVM.selectedDish = nil
        }){
            if let dish = menuVM.selectedDish{
                DishDetailView(dish: dish, cartVM: cartVM)
            }
        }
    }
}

#Preview {
    let repository = DataService()
    let useCase = FetchMenuUseCase(repository: repository)
    let viewModel = MenuViewModel(useCase: useCase)
    
    MenuContainerView(menuVM: viewModel)
        .environmentObject(CartSheetViewModel(checkoutUseCase: CheckoutUseCase()))
}
