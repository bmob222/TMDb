//
//  FailableDecodableArray.swift
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

/// Property wrapper to be used in arrays where,
/// during the decode process, we don't want to fail the whole array if an element is invalid.
///

public protocol CodableHashableEquatable: Codable, Hashable, Equatable {}

@propertyWrapper
public struct FailableDecodableArray<Element: CodableHashableEquatable>: Codable, Hashable, Equatable {
    public static func == (
        lhs: FailableDecodableArray<Element>,
        rhs: FailableDecodableArray<Element>
    ) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }

    public var wrappedValue: [Element]

    private struct ElementWrapper: Codable, Hashable, Equatable {
        static func == (
            lhs: FailableDecodableArray<Element>.ElementWrapper,
            rhs: FailableDecodableArray<Element>.ElementWrapper
        ) -> Bool {
            lhs.element == rhs.element
        }

        var element: Element?

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            do {
                self.element = try container.decode(Element.self)
            } catch {
                self.element = nil
            }
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(element)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let wrappers = try container.decode([ElementWrapper].self)
        self.wrappedValue = wrappers.compactMap(\.element)
    }

    public init(wrappedValue: [Element]) {
        self.wrappedValue = wrappedValue
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let wrappers = wrappedValue.map { $0 }
        try container.encode(wrappers)
    }
}
