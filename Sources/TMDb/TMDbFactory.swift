import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public final class TMDbFactory {
    private init() { }

}

public extension TMDbFactory {
    static var locale: Locale?

    internal static var apiClient: some APIClient {
        TMDbAPIClient(
            apiKey: TMDB.configuration.apiKey(),
            baseURL: .tmdbAPIBaseURL,
            httpClient: TMDB.configuration.httpClient(),
            serialiser: serialiser,
            localeProvider: localeProvider
        )
    }

    internal static func localeProvider() -> Locale {
        locale ?? .current
    }

}

extension TMDbFactory {

    static var defaultHTTPClientAdapter: some HTTPClient {
        URLSessionHTTPClientAdapter(urlSession: urlSession)
    }

    private static let urlSession = URLSession(configuration: urlSessionConfiguration)

    private static var urlSessionConfiguration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        #if os(iOS)
            configuration.multipathServiceType = .handover
        #endif

        configuration.requestCachePolicy = .useProtocolCachePolicy
        configuration.timeoutIntervalForRequest = 30

        #if !canImport(FoundationNetworking)
        configuration.waitsForConnectivity = true
        configuration.urlCache = urlCache
        #endif

        return configuration
    }

    #if !canImport(FoundationNetworking)
    private static var urlCache: URLCache {
        URLCache(memoryCapacity: 50_000_000, diskCapacity: 1_000_000_000)
    }
    #endif

    private static var serialiser: some Serialiser {
        Serialiser(decoder: .theMovieDatabase)
    }

}
