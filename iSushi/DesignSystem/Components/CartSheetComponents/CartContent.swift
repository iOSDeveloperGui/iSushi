//
//  CartContent.swift
//  iSushi
//
//  Created by iOS Developer on 16/01/26.
//

import SwiftUI

struct CartContent: View {
    let items: [CartItem]
    var onDelete: (IndexSet) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Your order")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .padding([.vertical, .horizontal], 16)
            
            if items.isEmpty{
                ContentUnavailableView("Empty Cart", systemImage: "cart", description: Text("Add some sushi!"))
            } else{
                List{
                    ForEach(items){ item in
                        CartItemRow(item: item)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: onDelete)
                    
                }
                .listStyle(.plain)
            }
        }
    }
}
