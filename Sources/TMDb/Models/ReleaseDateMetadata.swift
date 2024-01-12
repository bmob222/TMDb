import Foundation

/// Details describing an image.
public struct ReleaseDateContainer: Codable, Equatable, Hashable {
    public let iso_3166_1: String
    public let releaseDates: [ReleaseDateMetadata]

    public init(iso_3166_1: String, release_dates: [ReleaseDateMetadata]) {
        self.iso_3166_1 = iso_3166_1
        self.releaseDates = release_dates
    }

    enum CodingKeys: String, CodingKey {
        case iso_3166_1 = "iso31661"
        case releaseDates = "releaseDates"
    }
}

public struct ReleaseDateMetadata: Codable, Equatable, Hashable {
    public let certification: String?
    public let type: Int

    enum CodingKeys: String, CodingKey {
        case certification
        case type
    }

}
