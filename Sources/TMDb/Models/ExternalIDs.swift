//
//  ExternalIDs.swift
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

public struct ExternalIDs: Identifiable, Codable, Equatable, Hashable {

    ///
    /// Genre Identifier.
    ///
    public let id: Int

    ///
    /// Genre name.
    ///
    public let imdbId: String

    public let tvdbId: Int?
    ///
    /// Creates a genre object.
    ///
    /// - Parameters:
    ///    - id: Genre Identifier.
    ///    - name: Genre name.
    ///
    public init(id: Int, imdbId: String, tvdbId: Int? = nil) {
        self.id = id
        self.imdbId = imdbId
        self.tvdbId = tvdbId
    }

    enum CodingKeys: String, CodingKey {
        case id
        case imdbId
        case tvdbId
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ExternalIDs.CodingKeys> = try decoder.container(
            keyedBy: ExternalIDs.CodingKeys.self
        )

        self.id = try container.decode(Int.self, forKey: ExternalIDs.CodingKeys.id)
        self.imdbId = try container.decode(String.self, forKey: ExternalIDs.CodingKeys.imdbId)
        self.tvdbId = try container.decodeIfPresent(Int.self, forKey: ExternalIDs.CodingKeys.tvdbId)
    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<ExternalIDs.CodingKeys> = encoder.container(
            keyedBy: ExternalIDs.CodingKeys.self
        )

        try container.encode(id, forKey: ExternalIDs.CodingKeys.id)
        try container.encode(imdbId, forKey: ExternalIDs.CodingKeys.imdbId)
        try container.encodeIfPresent(tvdbId, forKey: ExternalIDs.CodingKeys.tvdbId)
    }

}
