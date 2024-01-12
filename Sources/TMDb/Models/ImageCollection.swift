import Foundation

///
/// A model representing an image collection.
///
/// A collection of poster and backdrop images for a movie or TV series.
///
public struct ImageCollection: Codable, Equatable, Hashable {

    ///
    /// Poster images.
    ///
    public let posters: [ImageMetadata]

    ///
    /// Logo images.
    ///
    public let logos: [ImageMetadata]

    ///
    /// Backdrop images.
    ///
    public let backdrops: [ImageMetadata]

    ///
    /// Creates an image collection object.
    ///
    /// - Parameters:
    ///    - id: Movie or TV series identifier for these images.
    ///    - posters: Poster images.
    ///    - backdrops: Backdrop images.
    ///    
    public init(
        posters: [ImageMetadata],
        logos: [ImageMetadata],
        backdrops: [ImageMetadata]
    ) {
        self.posters = posters
        self.logos = logos
        self.backdrops = backdrops
    }

}
