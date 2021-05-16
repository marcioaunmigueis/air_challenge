//
//  Icon.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//
import UIKit
import Foundation

struct Icon: Decodable {
  var title: String
  var subtitle: String
  var imageUrl: String
  
  var imageURL: URL {
    get {
      URL(string: imageUrl)!
    }
  }
}

struct Icons: Decodable {
  var icons: [Icon]
}
