import Foundation

enum TVSeriesEndpoint {

    case details(tvSeriesID: TVSeries.ID)
    case external_ids(tvSeriesID: TVSeries.ID)
    case credits(tvSeriesID: TVSeries.ID)
    case reviews(tvSeriesID: TVSeries.ID, page: Int? = nil)
    case images(tvSeriesID: TVSeries.ID, languageCode: String?)
    case videos(tvSeriesID: TVSeries.ID, languageCode: String?)
    case recommendations(tvSeriesID: TVSeries.ID, page: Int? = nil)
    case similar(tvSeriesID: TVSeries.ID, page: Int? = nil)
    case popular(page: Int? = nil)
    case watch(tvSeriesID: TVSeries.ID)
    case externalIDs(tvSeriesID: TVSeries.ID, seasonNumber: Int?, epsoideNumber: Int?)

}

extension TVSeriesEndpoint: Endpoint {

    private static let basePath = URL(string: "/tv")!

    var path: URL {
        switch self {
        case .details(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingQueryItem(name: "append_to_response", value: "videos,credits,images,content_ratings")
                .appendingQueryItem(name: "include_image_language", value: "en")

        case .credits(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("credits")

        case .reviews(let tvSeriesID, let page):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("reviews")
                .appendingPage(page)

        case .images(let tvSeriesID, let languageCode):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("images")
                .appendingImageLanguage(languageCode)

        case .videos(let tvSeriesID, let languageCode):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("videos")
                .appendingVideoLanguage(languageCode)

        case .recommendations(let tvSeriesID, let page):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("recommendations")
                .appendingPage(page)

        case .similar(let tvSeriesID, let page):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("similar")
                .appendingPage(page)

        case .popular(let page):
            return Self.basePath
                .appendingPathComponent("popular")
                .appendingPage(page)
                .appendingQueryItem(name: "include_adult", value: "false")

            
        case .external_ids(tvSeriesID: let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("external_ids")

        case .watch(let tvSeriesID):
            return Self.basePath
                .appendingPathComponent(tvSeriesID)
                .appendingPathComponent("watch/providers")

        case .externalIDs(let tvSeriesID,let seasonNumber, let epsoideNumber):
            let url = Self.basePath
                .appendingPathComponent(tvSeriesID)
            if let seasonNumber, let epsoideNumber {
             return url
                .appendingPathComponent("season")
                .appendingPathComponent(seasonNumber)
                .appendingPathComponent("episode")
                .appendingPathComponent(epsoideNumber)
                .appendingPathComponent("external_ids")
            } else {
                return url.appendingPathComponent("external_ids")
            }

        }
    }

}
