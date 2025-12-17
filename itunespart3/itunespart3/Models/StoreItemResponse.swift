//
//  StoreItemResponse.swift
//  itunespart3
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import Foundation
import Combine

struct StoreItemResponse: Decodable {
    let results: [StoreItem]
}
