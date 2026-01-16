//
//  CartSidePanelView.swift
//  iSushi
//
//  Created by iOS Developer on 04/01/26.
//

import Foundation
import SwiftUI

struct CartSidePanelView: View{
    @ObservedObject var viewModel: CartSheetViewModel
    
    var body: some View{
        VStack(spacing: 0){
            CartContent(items: viewModel.items){ indexSet in
                viewModel.items.remove(atOffsets: indexSet)
            }
            
            Spacer()
            
            TotalAmountComponent(total: viewModel.totalOrder, isButtonDisabled: viewModel.items.isEmpty, onCheckoutPressed: {
                viewModel.isShowingCheckout = true
            })
            
        }
        .frame(minWidth: 350)
        .blur(radius: viewModel.showSuccessView ? 10 : 0)
        .sheet(isPresented: $viewModel.isShowingCheckout){
            CheckoutView(viewModel: viewModel)
        }
        .preferredColorScheme(.dark)
    }
}
