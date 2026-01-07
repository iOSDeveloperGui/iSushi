//
//  SuccessView.swift
//  iSushi
//
//  Created by iOS Developer on 07/01/26.
//

import SwiftUI

struct SuccessViewComponent: View {
    @ObservedObject var viewModel: CartSheetViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Text("Order Received!")
                .font(.title.bold())
            
            Text("Your sushi is being prepared by our chefs.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button("Done") {
                viewModel.showSuccessView = false
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .transition(.scale.combined(with: .opacity))
    }
}

