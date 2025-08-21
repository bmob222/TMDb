//
//  DiscoverEndpoint.swift
//  TMDb
//
//  Copyright © 2024 Adam Young.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an AS IS BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

enum DiscoverEndpoint {

    case movies(
        sortedBy: MovieSort? = nil,
        people: [Person.ID]? = nil,
        page: Int? = nil,
        withNetworks: Int? = nil,
        withWatchProviders: Int? = nil,
        watchRegion: String? = nil,
        withGenres: Int? = nil,
        primaryReleaseYear: Int? = nil,
        primaryReleaseDateGte: String? = nil,
        primaryReleaseDateLte: String? = nil,
        releaseDateGte: String? = nil,
        releaseDateLte: String? = nil,
        voteCountGte: Int? = nil,
        voteCountLte: Int? = nil,
        voteAverageGte: Double? = nil,
        voteAverageLte: Double? = nil,
        withRuntimeGte: Int? = nil,
        withRuntimeLte: Int? = nil
    )
    case tvSeries(
        sortedBy: TVSeriesSort? = nil,
        page: Int? = nil,
        withNetworks: Int? = nil,
        withWatchProviders: Int? = nil,
        watchRegion: String? = nil,
        withGenres: Int? = nil,
        firstAirDateYear: Int? = nil,
        firstAirDateGte: String? = nil,
        firstAirDateLte: String? = nil,
        voteCountGte: Int? = nil,
        voteCountLte: Int? = nil,
        voteAverageGte: Double? = nil,
        voteAverageLte: Double? = nil,
        withRuntimeGte: Int? = nil,
        withRuntimeLte: Int? = nil
    )

}

extension DiscoverEndpoint: Endpoint {

    private static let basePath = URL(string: "/discover")!

    var path: URL {
        switch self {
        case let .movies(
            sortedBy,
            people,
            page,
            withNetworks,
            withWatchProviders,
            watchRegion,
            withGenres,
            primaryReleaseYear,
            primaryReleaseDateGte,
            primaryReleaseDateLte,
            releaseDateGte,
            releaseDateLte,
            voteCountGte,
            voteCountLte,
            voteAverageGte,
            voteAverageLte,
            withRuntimeGte,
            withRuntimeLte
        ):
            Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingPage(page)
                .appendingWithNetworks(withNetworks)
                .appendingWithWatchProviders(withWatchProviders)
                .appendingWatchRegion(watchRegion)
                .appendingWithGenres(withGenres)
                .appendingPrimaryReleaseYear(primaryReleaseYear)
                .appendingPrimaryReleaseDateGte(primaryReleaseDateGte)
                .appendingPrimaryReleaseDateLte(primaryReleaseDateLte)
                .appendingReleaseDateGte(releaseDateGte)
                .appendingReleaseDateLte(releaseDateLte)
                .appendingVoteCountGte(voteCountGte)
                .appendingVoteCountLte(voteCountLte)
                .appendingVoteAverageGte(voteAverageGte)
                .appendingVoteAverageLte(voteAverageLte)
                .appendingWithRuntimeGte(withRuntimeGte)
                .appendingWithRuntimeLte(withRuntimeLte)
                .appendingQueryItem(name: "include_adult", value: "false")
                .appendingQueryItem(name: "certification_country", value: "US")
                .appendingQueryItem(name: "certification.lte", value: "NC-17")

        case let .tvSeries(
            sortedBy,
            page,
            withNetworks,
            withWatchProviders,
            watchRegion,
            withGenres,
            firstAirDateYear,
            firstAirDateGte,
            firstAirDateLte,
            voteCountGte,
            voteCountLte,
            voteAverageGte,
            voteAverageLte,
            withRuntimeGte,
            withRuntimeLte
        ):
            Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingPage(page)
                .appendingWithNetworks(withNetworks)
                .appendingWithWatchProviders(withWatchProviders)
                .appendingWatchRegion(watchRegion)
                .appendingWithGenres(withGenres)
                .appendingFirstAirDateYear(firstAirDateYear)
                .appendingFirstAirDateGte(firstAirDateGte)
                .appendingFirstAirDateLte(firstAirDateLte)
                .appendingVoteCountGte(voteCountGte)
                .appendingVoteCountLte(voteCountLte)
                .appendingVoteAverageGte(voteAverageGte)
                .appendingVoteAverageLte(voteAverageLte)
                .appendingWithRuntimeGte(withRuntimeGte)
                .appendingWithRuntimeLte(withRuntimeLte)
                .appendingQueryItem(name: "include_adult", value: "false")
                .appendingQueryItem(name: "certification_country", value: "US")
                .appendingQueryItem(name: "certification.lte", value: "NC-17")

        }
    }

}
