////  StoreItem.swift
//  itunespart3
//
//  Created by Yaquelin Cisneros on 12/3/25.
//

import Foundation

struct StoreItem: Decodable {
    let name: String
    let artist: String
    let kind: String
    let description: String
    let artworkURL: URL

    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind
        case description
        case artworkURL = "artworkUrl100"
    }

    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let extra = try? decoder.container(keyedBy: AdditionalKeys.self)

        name = try container.decode(String.self, forKey: .name)
        artist = try container.decode(String.self, forKey: .artist)
        kind = try container.decode(String.self, forKey: .kind)
        artworkURL = try container.decode(URL.self, forKey: .artworkURL)

        if let long = try? extra?.decode(String.self, forKey: .longDescription) {
            description = long
        } else {
            description = (try? container.decode(String.self, forKey: .description)) ?? ""
        }
    }
}

