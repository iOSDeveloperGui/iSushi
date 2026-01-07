//
//  MovingBackground.swift
//  iSushi
//
//  Created by iOS Developer on 16/12/25.
//

import SwiftUI

struct MovingBackground: View{
    @Binding var backgroundOffset: CGFloat
    
    var body: some View{
        GeometryReader{ geometry in
            Image(.sushiBackground)
                .resizable()
                .scaledToFill()
                .frame(
                    width: geometry.size.width * 1.4,
                    height: geometry.size.height * 1.4
                )
                .blur(radius: 12)
                .offset(
                    x: backgroundOffset * -((geometry.size.width * 0.1) / 2),
                    y: backgroundOffset * -((geometry.size.height * 0.2) / 2)
                )
                .position(
                    x: geometry.size.width / 2 + backgroundOffset * (geometry.size.width * 0.1),
                    y: geometry.size.height / 2 + backgroundOffset * (geometry.size.height * 0.1)
                )
        }
    }
}
