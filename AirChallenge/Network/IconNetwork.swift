//
//  File.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//
import Foundation
import Combine

class IconNetwork {
  var cancellables = Set<AnyCancellable>()

  func fetchURL<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }

}
