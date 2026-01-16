//
//  SuccessView.swift
//  iSushi
//
//  Created by iOS Developer on 07/01/26.
//

import SwiftUI

struct SuccessViewComponent: View {
    var onDone: () -> Void
    
    var body: some View {
        VStack(spacing: 24){
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
                .symbolEffect(.bounce, options: .repeat(2))
            
            Text("Order Received!")
                .font(.title.bold())
            
            Text("Your sushi is being prepared by our chefs.")
                .foregroundColor(.secondary)
            
            Button("Done") {
                onDone()
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
        }
        .padding([.vertical, .horizontal], 16)
    }
}

