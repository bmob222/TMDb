import Foundation

public struct ExternalIDs: Identifiable, Codable, Equatable, Hashable {

    public let id: Int
    public let imdbId: String
    public let tvdbId: Int?
    
    public init(id: Int, imdbId: String, tvdbId: Int? = nil) {
        self.id = id
        self.imdbId = imdbId
        self.tvdbId = tvdbId
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case imdbId = "imdbId"
        case tvdbId = "tvdbId"
    }
    
    
    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ExternalIDs.CodingKeys> = try decoder.container(keyedBy: ExternalIDs.CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: ExternalIDs.CodingKeys.id)
        self.imdbId = try container.decode(String.self, forKey: ExternalIDs.CodingKeys.imdbId)
        self.tvdbId = try container.decode(Int.self, forKey: ExternalIDs.CodingKeys.tvdbId)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<ExternalIDs.CodingKeys> = encoder.container(keyedBy: ExternalIDs.CodingKeys.self)
        try container.encode(self.id, forKey: ExternalIDs.CodingKeys.id)
        try container.encode(self.imdbId, forKey: ExternalIDs.CodingKeys.imdbId)
        try container.encode(self.tvdbId, forKey: ExternalIDs.CodingKeys.tvdbId)
    }
    
    
}

