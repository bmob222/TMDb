import Foundation

/// Details describing an image.
public struct ReleaseDateContainer: Codable, Equatable, Hashable {
    public let iso31661: String
    public let releaseDates: [ReleaseDateMetadata]

    public init(iso31661: String, releaseDates: [ReleaseDateMetadata]) {
        self.iso31661 = iso31661
        self.releaseDates = releaseDates
    }

    enum CodingKeys: String, CodingKey {
        case iso31661
        case releaseDates
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
