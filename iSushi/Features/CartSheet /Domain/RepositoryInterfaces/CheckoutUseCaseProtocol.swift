//
//  CheckoutUseCaseProtocol.swift
//  iSushi
//
//  Created by iOS Developer on 06/01/26.
//

import Foundation

protocol CheckoutUseCaseProtocol{
    func execute(items: [CartItem]) async throws -> Bool
}
