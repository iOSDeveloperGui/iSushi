//
//  DishContentView.swift
//  iSushi
//
//  Created by iOS Developer on 17/12/25.
//

import SwiftUI

struct DishContentView: View {
    let dishes: [Dish]
    let selectedDish: Dish?
    var onSelect: (Dish) -> Void
    
    let columns = [
        GridItem(.adaptive(minimum: 280), spacing: 20)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 32){
                ForEach(dishes){ dish in
                    SushiCard(dish: dish,
                              isSelected: selectedDish?.id == dish.id,
                              onDetailsTap: { onSelect(dish) }
                    )
                    .onTapGesture {
                        onSelect(dish)
                    }
                    
                }
            }
            .padding([.horizontal, .vertical], 16)
        }
        .navigationTitle("Menu")
        .background(Color.blackbg)
    }
}


