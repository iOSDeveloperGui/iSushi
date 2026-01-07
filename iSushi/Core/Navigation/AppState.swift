//
//  AppState.swift
//  iSushi
//
//  Created by iOS Developer on 16/12/25.
//

import Foundation
import Combine

class AppState: ObservableObject{
    @Published private var screen: Screens = .welcome
    private var isLoading: Bool = false
    
    func showMenu(){
        isLoading = true
        
        self.screen = .menu
        isLoading = false 
    }
}
