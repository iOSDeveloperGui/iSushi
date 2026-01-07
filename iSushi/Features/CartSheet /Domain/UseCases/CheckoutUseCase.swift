//
//  CheckoutUseCaseProtocol.swift
//  iSushi
//
//  Created by iOS Developer on 06/01/26.
//

import Foundation

class CheckoutUseCase: CheckoutUseCaseProtocol{
    func execute(items: [CartItem]) async throws -> Bool {
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        print("Order processed for \(items.count) items.")
        return true
    }
}
