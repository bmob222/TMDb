import Foundation

public struct ExternalIDs: Identifiable, Codable, Equatable, Hashable {

    ///
    /// Genre Identifier.
    ///
    public let id: Int

    ///
    /// Genre name.
    ///
    public let imdbId: String

    ///
    /// Creates a genre object.
    ///
    /// - Parameters:
    ///    - id: Genre Identifier.
    ///    - name: Genre name.
    ///
    public init(id: Int, imdbId: String) {
        self.id = id
        self.imdbId = imdbId
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case imdbId = "imdb_id"
    }
    

}

