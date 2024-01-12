import Foundation

///
/// A model representing a show's (movie or TV series) credits.
///
/// A person can be both a cast member and crew member of the same show.
///
public struct ShowCredits: Codable, Equatable, Hashable {

    ///
    /// Cast members of the show.
    ///
    public let cast: [CastMember]

    ///
    /// Crew members of the show.
    ///
    public let crew: [CrewMember]

    ///
    /// Creates a show credits object.
    ///
    /// - Parameters:
    ///    - id: Movie or TV series identifier.
    ///    - cast: Cast members of the show.
    ///    - crew: Crew members of the show.
    ///
    public init(cast: [CastMember], crew: [CrewMember]) {
        self.cast = cast
        self.crew = crew
    }

}
