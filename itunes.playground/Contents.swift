import UIKit
import Foundation

// got the main iTunes Search API link from the book thing
let baseURL = URL(string: "https://itunes.apple.com/search")

// this dictionary holds what I'm asking iTunes to search for
// "term" is what I want, "media" is the type (music in this case)
let quiery: [String: String] = [
    "term": "Pierce The Veil",
    "media": "music"
]

// used an extension to give URL a new feature without touching the original type
// soo basically I can attach a dictionary of queries to any URL
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        // break the URL into pieces so I can add query stuff
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        // turn each key/value in the dictionary into something the URL understands
        // builds ?term=Pierce+The+Veil&media=music
        components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        // return the full URL with queries attached
        return components?.url
    }
}


// my model for each iTunes item
struct StoreItem: Codable {
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
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        artist = try values.decode(String.self, forKey: .artist)
        kind = try values.decode(String.self, forKey: .kind)
        artworkURL = try values.decode(URL.self, forKey: .artworkURL)
        
        // try description first, if not there try longDescription, otherwise just empty string
        if let desc = try? values.decode(String.self, forKey: .description) {
            description = desc
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: .longDescription)) ?? ""
        }
    }
}

// wrap the results in a response struct
struct SearchResponse: Codable {
    let results: [StoreItem]
}

// simple error for when nothing comes back
enum StoreItemError: Error {
    case itemsNotFound
}

// function to fetch items from iTunes
func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {

    //  make the url for the iTunes search api
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!

    //  Add your search stuff (like term media type) to the URL
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }

    //  Ask the internet for data at that URL (this can take time.. so we await it
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)

    //  Make sure the internet said ok.. status code 200
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
    }
    
    if let jsonString = String(data: data, encoding: .utf8) {
        print(jsonString)
    }


    //  Turn the JSON data we got from the internet into Swift objects
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)

    //  Give back the list of items we found
    return searchResponse.results
}


// use the extension to make the final search URL
if let searchURL = baseURL?.withQueries(quiery) {
    print(searchURL) // just to check it looks right

    // now the part where I actually ask iTunes for the data
    Task {
        do {
            // send the request over the internet and wait for data to come back
            let storeItems = try await fetchItems(matching: quiery)
            
            // loop through all the items iTunes sent me and print info
            storeItems.forEach { item in
                print("""
                    Name: \(item.name)
                    Artist: \(item.artist)
                    Kind: \(item.kind)
                    Description: \(item.description)
                    Artwork URL: \(item.artworkURL)
                    """)
            }
        } catch {
            print("Error fetching data: \(error)") // in case something goes wrong
        }
    }
}

//Purpose: What does it do?
//Steps: What does it do first, second, last?
//Why: Why did you write it that way?
