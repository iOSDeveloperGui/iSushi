//
//  TotalAmountComponent.swift
//  iSushi
//
//  Created by iOS Developer on 16/01/26.
//

import SwiftUI

struct TotalAmountComponent: View {
    let total: Double
    let isButtonDisabled: Bool
    let onCheckoutPressed: () -> Void
    
    var body: some View {
        
        VStack(spacing: 16){
            Divider()
            HStack{
                Text("Total Amount")
                
                Spacer()
                
                Text("$\(total, specifier: "%.2f")")
                    .foregroundStyle(.white)
                    .bold()
            }
            .padding([.horizontal, .vertical], 16)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Button(action: {
                onCheckoutPressed()
            }, label: {
                Text("Checkout")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
            })
            .buttonStyle(.borderedProminent)
            .tint(.buttonSushi)
            .disabled(isButtonDisabled)
            
        }
        .padding([.vertical, .horizontal], 16)
    }
}

