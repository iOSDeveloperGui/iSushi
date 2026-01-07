//
//  FetchMenuUseCaseProtocol.swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation

protocol FetchMenuUseCaseProtocol: AnyObject{
    func execute() async throws -> [Dish]
}
