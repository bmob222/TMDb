import Foundation

public struct ContentRatingsCollection: Codable, Equatable, Hashable {

    public let results: [ContentRating]

    public init(results: [ContentRating]) {
        self.results = results
    }

    enum CodingKeys: String, CodingKey {
        case results
    }

}
