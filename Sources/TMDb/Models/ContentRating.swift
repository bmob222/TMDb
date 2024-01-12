import Foundation

public struct ContentRating: Codable, Equatable, Hashable {
    public let iso31661: String
    public let rating: String

    public init(iso31661: String, rating: String) {
        self.iso31661 = iso31661
        self.rating = rating
    }

    enum CodingKeys: String, CodingKey {
        case iso31661
        case rating
    }

}
