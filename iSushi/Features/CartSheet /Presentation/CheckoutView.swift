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
            ZStack{
                if viewModel.showSuccessView{
                    SuccessViewComponent(){
                        viewModel.showSuccessView = false
                        dismiss()
                    }
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                } else{
                    OrderSummaryComponent(viewModel: viewModel)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                }
            }
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
