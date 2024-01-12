import Foundation

public struct ReleaseDateCollection: Codable, Equatable, Hashable {
    public let results: [ReleaseDateContainer]

    public init(results: [ReleaseDateContainer]) {
        self.results = results
    }

    enum CodingKeys: String, CodingKey {
        case results
    }

}
