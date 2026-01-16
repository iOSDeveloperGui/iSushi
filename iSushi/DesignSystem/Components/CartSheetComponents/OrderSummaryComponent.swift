//
//  OrderSummary.swift
//  iSushi
//
//  Created by iOS Developer on 07/01/26.
//

import SwiftUI

struct OrderSummaryComponent: View {
    @ObservedObject var viewModel: CartSheetViewModel
    
    var body: some View {
        VStack{
            List{
                Section("Order Summary"){
                    ForEach(viewModel.items){ item in
                        HStack{
                            Text("\(item.quantity)x \(item.dish.name)")
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                            
                            Text("\(item.dish.price * Double(item.quantity), format: .currency(code: "USD"))")
                        }
                        .padding(.horizontal, 20)
                    }
                }
                
                Section{
                    HStack{
                        Text("Total")
                            .bold()
                        
                        Spacer()
                        
                        Text(viewModel.totalOrder, format: .currency(code: "USD"))
                            .bold()
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal, 20)
                }
                
            }
            .listStyle(.grouped)
            Button(action: {
                Task{
                    await viewModel.checkout()
                }
            }, label: {
                if viewModel.isProcessing{
                    ProgressView()
                        .tint(Color.white)
                } else{
                    Text("Confirm")
                        .frame(maxWidth: .infinity)
                        .bold()
                }
            })
            .buttonStyle(.borderedProminent)
            .tint(.buttonGreen1)
            .padding([.vertical, .horizontal], 32)
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
