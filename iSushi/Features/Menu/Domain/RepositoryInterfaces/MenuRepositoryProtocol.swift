//
//  FetchMenuUseCaseProtocol.swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation

protocol MenuRepositoryProtocol: AnyObject{
    func fetchMenu() async throws -> [Dish]
}
