import Foundation

/// Property wrapper to be used in arrays where, during the decode process, we don't want to fail the whole array if an element is invalid.
///

public protocol CodableHashableEquatable: Codable, Hashable, Equatable {

}
@propertyWrapper
public struct FailableDecodableArray<Element: CodableHashableEquatable>: Codable, Hashable, Equatable {
    public static func == (lhs: FailableDecodableArray<Element>, rhs: FailableDecodableArray<Element>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }

    public var wrappedValue: [Element]

    private struct ElementWrapper: Codable, Hashable, Equatable {
        static func == (lhs: FailableDecodableArray<Element>.ElementWrapper, rhs: FailableDecodableArray<Element>.ElementWrapper) -> Bool {
            lhs.element == rhs.element
        }

        var element: Element?

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            do {
                element = try container.decode(Element.self)
            } catch {
                element = nil
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
