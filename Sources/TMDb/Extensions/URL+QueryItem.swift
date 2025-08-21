//
//  URL+QueryItem.swift
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

extension URL {

    func appendingPathComponent(_ value: Int) -> Self {
        appendingPathComponent(String(value))
    }

    func appendingQueryItem(name: String, value: CustomStringConvertible) -> Self {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        var queryItems = urlComponents.queryItems ?? []
        queryItems.append(URLQueryItem(name: name, value: value.description))
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }

}

extension URL {

    private enum QueryItemName {
        static let apiKey = "api_key"
        static let language = "language"
        static let imageLanguage = "include_image_language"
        static let videoLanguage = "include_video_language"
        static let page = "page"
        static let year = "year"
        static let firstAirDateYear = "first_air_date_year"
        static let withPeople = "with_people"
        static let withNetworks = "with_networks"
        static let withWatchProviders = "with_watch_providers"
        static let withGenres = "with_genres"
        static let watchRegion = "watch_region"
        static let primaryReleaseYear = "primary_release_year"
        static let primaryReleaseDateGte = "primary_release_date.gte"
        static let primaryReleaseDateLte = "primary_release_date.lte"
        static let releaseDateGte = "release_date.gte"
        static let releaseDateLte = "release_date.lte"
        static let voteCountGte = "vote_count.gte"
        static let voteCountLte = "vote_count.lte"
        static let voteAverageGte = "vote_average.gte"
        static let voteAverageLte = "vote_average.lte"
        static let withRuntimeGte = "with_runtime.gte"
        static let withRuntimeLte = "with_runtime.lte"
        static let firstAirDateGte = "first_air_date.gte"
        static let firstAirDateLte = "first_air_date.lte"
    }

    func appendingAPIKey(_ apiKey: String) -> Self {
        appendingQueryItem(name: QueryItemName.apiKey, value: apiKey)
    }

    func appendingLanguage(_ languageCode: String?) -> Self {
        guard let languageCode else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.language, value: languageCode)
    }

    func appendingImageLanguage(_ languageCode: String?) -> Self {
        guard let languageCode else {
            return self
        }

        let value = [languageCode, "null"]
            .map(\.description)
            .joined(separator: ",")

        return appendingQueryItem(name: QueryItemName.imageLanguage, value: value)
    }

    func appendingVideoLanguage(_ languageCode: String?) -> Self {
        guard let languageCode else {
            return self
        }

        let value = [languageCode, "null"]
            .map(\.description)
            .joined(separator: ",")

        return appendingQueryItem(name: QueryItemName.videoLanguage, value: value)
    }

    func appendingPage(_ page: Int?) -> Self {
        guard var page else {
            return self
        }

        page = max(page, 1)
        page = min(page, 1000)

        return appendingQueryItem(name: QueryItemName.page, value: page)
    }

    func appendingYear(_ year: Int?) -> Self {
        guard let year else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.year, value: year)
    }
    
    func appendingPrimaryReleaseYear(_ year: Int?) -> Self {
        guard let year else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.primaryReleaseYear, value: year)
    }

    func appendingFirstAirDateYear(_ year: Int?) -> Self {
        guard let year else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.firstAirDateYear, value: year)
    }

    func appendingWithPeople(_ peopleIDs: [Person.ID]?) -> Self {
        guard let peopleIDs else {
            return self
        }

        let value = peopleIDs
            .map(\.description)
            .joined(separator: ",")

        return appendingQueryItem(name: QueryItemName.withPeople, value: value)
    }

    func appendingWithNetworks(_ withNetworks: Int?) -> Self {
        guard let withNetworks else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.withNetworks, value: withNetworks)
    }

    func appendingWithWatchProviders(_ withWatchProviders: Int?) -> Self {
        guard let withWatchProviders else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.withWatchProviders, value: withWatchProviders)
    }
    
    
    func appendingWithGenres(_ withGenres: Int?) -> Self {
        guard let withGenres else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.withGenres, value: withGenres)
    }
    
    func appendingPrimaryReleaseDateGte(_ date: String?) -> Self {
        guard let date else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.primaryReleaseDateGte, value: date)
    }
    
    func appendingPrimaryReleaseDateLte(_ date: String?) -> Self {
        guard let date else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.primaryReleaseDateLte, value: date)
    }
    
    func appendingReleaseDateGte(_ date: String?) -> Self {
        guard let date else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.releaseDateGte, value: date)
    }
    
    func appendingReleaseDateLte(_ date: String?) -> Self {
        guard let date else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.releaseDateLte, value: date)
    }
    
    func appendingVoteCountGte(_ count: Int?) -> Self {
        guard let count else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.voteCountGte, value: count)
    }
    
    func appendingVoteCountLte(_ count: Int?) -> Self {
        guard let count else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.voteCountLte, value: count)
    }
    
    func appendingVoteAverageGte(_ average: Double?) -> Self {
        guard let average else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.voteAverageGte, value: average)
    }
    
    func appendingVoteAverageLte(_ average: Double?) -> Self {
        guard let average else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.voteAverageLte, value: average)
    }
    
    func appendingWithRuntimeGte(_ runtime: Int?) -> Self {
        guard let runtime else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.withRuntimeGte, value: runtime)
    }
    
    func appendingWithRuntimeLte(_ runtime: Int?) -> Self {
        guard let runtime else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.withRuntimeLte, value: runtime)
    }

    func appendingFirstAirDateGte(_ date: String?) -> Self {
        guard let date else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.firstAirDateGte, value: date)
    }
    
    func appendingFirstAirDateLte(_ date: String?) -> Self {
        guard let date else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.firstAirDateLte, value: date)
    }

}
