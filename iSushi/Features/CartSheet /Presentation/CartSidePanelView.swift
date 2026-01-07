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
        ZStack{
            VStack(alignment: .leading){
                Text("Your order")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                
                if viewModel.items.isEmpty{
                    ContentUnavailableView("Empty Cart", systemImage: "cart", description: Text("Add some sushi!"))
                } else{
                    List{
                        ForEach(viewModel.items){ item in
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
                                        .font(.subheadline)
                                        .bold()
                                    
                                    Text("$\(item.dish.price, specifier: "%.2f") x \(item.quantity)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("$\(item.subTotal, specifier: "%.2f")")
                                    .bold()
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                    }
                    .listStyle(.plain)
                }
                
                VStack(spacing: 16){
                    Divider()
                    HStack{
                        Text("Total Amount")
                        
                        Spacer()
                        
                        Text("$\(viewModel.totalOrder, specifier: "%.2f")")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .padding([.horizontal, .vertical], 16)
                    .background(Color.gray.opacity(0.1))
                    
                    Button(action: {
                        viewModel.isShowingCheckout = true
                    }, label: {
                        Text("Checkout")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.buttonSushi)
                    .disabled(viewModel.items.isEmpty)
                    
                }
                .padding([.vertical, .horizontal], 16)
            }
            .frame(minWidth: 350)
        }
        .blur(radius: viewModel.showSuccessView ? 10 : 0)
        .sheet(isPresented: $viewModel.isShowingCheckout){
            CheckoutView(viewModel: viewModel)
        }
    }
}
