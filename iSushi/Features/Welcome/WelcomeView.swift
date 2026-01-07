//
//  WelcomeView.swift
//  iSushi
//
//  Created by iOS Developer on 16/12/25.
//

import SwiftUI

struct WelcomeView: View{
    @State private var backgroundOffset: CGFloat = 0.0
    
    private let animatioDuration: Double = 30.0
    
    var body: some View{
        ZStack{
            MovingBackground(backgroundOffset: $backgroundOffset)
            
            Color.black.opacity(0.4)
                
            VStack(spacing: 8){
                Spacer()
                
                Image(.iSushiLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
        
                Text("Welcome to iSushi")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Text("Experience the best of japanese food")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
                    .lineLimit(2)
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut){
                    }
                }, label:{
                    Text("Enter App")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(red: 0.85, green: 0.2, blue: 0.2))
                        )
                        .padding([.horizontal, .vertical], 40)
                })
                
                .buttonStyle(.plain)
            }
        }
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: animatioDuration).repeatForever(autoreverses: true)){
                backgroundOffset = 4.0
            }
        }
    }
}

#Preview{
    WelcomeView()
}
