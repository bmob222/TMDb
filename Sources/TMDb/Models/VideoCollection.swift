import Foundation

///
/// A model representing a collection of video images for a movie or TV series.
///
public struct VideoCollection: Codable, Equatable, Hashable {

    ///
    /// List of videos.
    ///
    public let results: [VideoMetadata]

    ///
    /// Creates a video collection object.
    ///
    /// - Parameters:
    ///    - id: Movie or TV series identifier.
    ///    - results: Videos.
    ///
    public init(results: [VideoMetadata]) {
        self.results = results
    }

}
