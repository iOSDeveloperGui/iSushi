//
//  DishDetailView.swift
//  iSushi
//
//  Created by iOS Developer on 17/12/25.
//

import SwiftUI

struct DishDetailView: View {
    let dish: Dish
    @ObservedObject var cartVM: CartSheetViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(url: URL(string: dish.imageUrl)){ image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                Color.gray.opacity(0.4)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 16)
            
            VStack{
                Text(dish.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .lineLimit(1)
                
                Text(dish.description)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .frame(height: 35)
            }
            .padding(.vertical, 16)
            
            HStack{
                Text("Price: $\(dish.price, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Text(dish.category)
                    .font(.system(size: 16))
                    .foregroundStyle(Color.black)
                    .padding([.horizontal, .vertical], 16)
                    .background(Capsule().fill(Color.white))
            }
            .padding(.horizontal, 16)
            
            Button(action: {
                cartVM.addToCart(dish: dish)
                dismiss()
            }, label: {
                Text("Add to Order")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(Color.buttonSushi)
                    )
    
            })
            .padding([.horizontal, .vertical], 16)

        }
        .padding([.horizontal, .vertical], 16)
    }
}


