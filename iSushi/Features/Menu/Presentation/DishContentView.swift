//
//  DishContentView.swift
//  iSushi
//
//  Created by iOS Developer on 17/12/25.
//

import SwiftUI

struct DishContentView: View {
    let dishes: [Dish]
    @ObservedObject var viewModel: MenuViewModel
    @Binding var selectedDish: Dish?
    
    let columns = [
        GridItem(.adaptive(minimum: 280), spacing: 20)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 32){
                ForEach(dishes){ dish in
                    SushiCard(dish: dish, viewModel: viewModel)
                        .onTapGesture {
                            selectedDish = dish
                            viewModel.showDetailSheet = true
                        }
                        .overlay(
                            selectedDish?.id == dish.id ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 4) : nil
                            
                        )
                }
            }
            .padding([.horizontal, .vertical], 16)
        }
        .navigationTitle("Menu")
        .preferredColorScheme(.dark)
        .sheet(item: $selectedDish){ dish in
            DishDetailView(dish: dish)
        }
        
        
    }
}


