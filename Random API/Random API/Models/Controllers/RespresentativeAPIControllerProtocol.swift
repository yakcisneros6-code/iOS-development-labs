//
//  RespresentativeAPIControllerProtocol.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import Foundation

protocol RepresentativeAPIControllerProtocol {
    func fetchRepresentatives(for zipCode: String) async throws -> [Representative]
}

