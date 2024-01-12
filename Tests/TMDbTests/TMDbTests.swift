@testable import TMDb
import XCTest

final class TMDbTest: XCTestCase {

    func testConfigureSetsAPIKey() {
        let expectedAPIKey = "abc123"
        let configuration = TMDbConfiguration(apiKey: expectedAPIKey)

        TMDB.configure(configuration)
        let apiKey = TMDB.configuration.apiKey()

        XCTAssertEqual(apiKey, expectedAPIKey)
    }

    func testConfigurationWhenHTTPClientNotSetUsesDefaultAdapter() {
        let configuration = TMDbConfiguration(apiKey: "")

        TMDB.configure(configuration)
        let httpClient = TMDB.configuration.httpClient()

        XCTAssertTrue(httpClient is URLSessionHTTPClientAdapter)
    }

    func testConfigurationWhenSetsHTTPClient() {
        let expectedHTTPClient = MockHTTPClient()
        let configuration = TMDbConfiguration(apiKey: "", httpClient: expectedHTTPClient)

        TMDB.configure(configuration)
        let httpClient = TMDB.configuration.httpClient()

        XCTAssertIdentical(httpClient as AnyObject, expectedHTTPClient)
    }

}

extension TMDbTest {

    private final class MockHTTPClient: HTTPClient {

        init() { }

        func get(url: URL, headers: [String: String]) async throws -> HTTPResponse {
            HTTPResponse()
        }
    }

}
