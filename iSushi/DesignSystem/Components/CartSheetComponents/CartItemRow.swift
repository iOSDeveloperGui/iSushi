//
//  CartItemRow.swift
//  iSushi
//
//  Created by iOS Developer on 16/01/26.
//

import SwiftUI

struct CartItemRow: View {
    let item: CartItem
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: item.dish.imageUrl)){ image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.4)
            }
            .frame(width: 80, height: 60)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding([.horizontal, .vertical], 16)
            
            VStack(alignment: .leading){
                Text(item.dish.name)
                    .font(.system(.subheadline, weight: .bold))
                
                Text("$\(item.dish.price, specifier: "%.2f") x \(item.quantity)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text("$\(item.subTotal, specifier: "%.2f")")
                .font(.system(.subheadline, weight: .bold))
        }
        .padding(.vertical, 8)
    }
}

