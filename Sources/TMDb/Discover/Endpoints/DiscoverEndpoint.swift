import Foundation

enum DiscoverEndpoint {

    case movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil, page: Int? = nil, with_networks: Int? = nil)
    case tvSeries(sortedBy: TVSeriesSort? = nil, page: Int? = nil, with_networks: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case .movies(let sortedBy, let people, let page, let with_networks):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingPage(page)
                .appendingWithNetworks(with_networks)
                .appendingQueryItem(name: "include_adult", value: "false")

        case .tvSeries(let sortedBy, let page, let with_networks):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingPage(page)
                .appendingWithNetworks(with_networks)
                .appendingQueryItem(name: "include_adult", value: "false")
        }
    }

}
