//
//  ReleaseDateMetadata.swift
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

/// Details describing an image.
public struct ReleaseDateContainer: Codable, Equatable, Hashable {
    public let iso31661: String
    public let releaseDates: [ReleaseDateMetadata]

    public init(iso31661: String, releaseDates: [ReleaseDateMetadata]) {
        self.iso31661 = iso31661
        self.releaseDates = releaseDates
    }

    enum CodingKeys: String, CodingKey {
        case iso31661
        case releaseDates
    }
}

public struct ReleaseDateMetadata: Codable, Equatable, Hashable {
    public let certification: String?
    public let type: Int

    enum CodingKeys: String, CodingKey {
        case certification
        case type
    }

}
