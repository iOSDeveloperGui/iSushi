//
//  CheckoutView.swift
//  iSushi
//
//  Created by iOS Developer on 07/01/26.
//

import Foundation
import SwiftUI

struct CheckoutView: View{
    @ObservedObject var viewModel: CartSheetViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        NavigationStack{
            VStack{
                if viewModel.showSuccessView{
                    SuccessViewComponent(viewModel: viewModel)
                } else{
                    OrderSummaryComponent(viewModel: viewModel)
                }
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if !viewModel.showSuccessView{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                }
            }
        }
        
    }
    
}
