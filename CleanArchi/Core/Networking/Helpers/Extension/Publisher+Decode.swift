//
//  Publisher+Decode.swift
//
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine

public extension Publisher {
    func decode<Item, Coder>(type: Item.Type, decoder: Coder, errorTransform: @escaping (Error) -> Failure) -> Publishers.FlatMap<Publishers.MapError<Publishers.Decode<Just<Self.Output>, Item, Coder>, Self.Failure>, Self> where Item: Decodable, Coder: TopLevelDecoder, Self.Output == Coder.Input {
        return flatMap {
            Just($0)
                .decode(type: type, decoder: decoder)
                .mapError { errorTransform($0) }
        }
    }
}
