//
//  SushiCard.swift
//  iSushi
//
//  Created by iOS Developer on 29/12/25.
//

import Foundation
import SwiftUI

struct SushiCard: View{
    let dish: Dish
    let isSelected: Bool
    let onDetailsTap: () -> Void
    
    var body: some View{
        VStack(spacing: 0){
            AsyncImage(url: URL(string: dish.imageUrl)){ imageUrl in
                imageUrl
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 160)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding([.top, .horizontal ], 12)
            
            VStack(spacing: 12){
                Text(dish.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .lineLimit(1)
                
                Text(dish.description)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            .padding([.horizontal, .vertical ], 16)
            
            Button(action: {
                onDetailsTap()
            }, label: {
                Text("See details")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(RoundedRectangle(cornerRadius: 16)
                        .fill(Color.buttonSushi)
                    )
    
            })
            .padding([.horizontal, .bottom], 12)
        }
        .onTapGesture { onDetailsTap() }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.2))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.buttonSushi, lineWidth: isSelected ? 3 : 0)
        )
        
    }
}
