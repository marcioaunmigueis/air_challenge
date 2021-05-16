//
//  ImageLoader.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import UIKit

class ImageLoader {
  var loadedImages = [URL: UIImage]()
  var runningRequests = [UUID: URLSessionDataTask] ()
  
  func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {

    if let image = loadedImages[url] {
      completion(.success(image))
      return nil
    }
    let uuid = UUID()
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      defer {self.runningRequests.removeValue(forKey: uuid) }
      if let data = data,
         let image = UIImage(data: data) {
        self.loadedImages[url] = image
        completion(.success(image))
        return
      }
      guard let error = error else {
        // without an image or an error, we'll just ignore this for now
        // you could add your own special error cases for this scenario
        return
      }
      guard (error as NSError).code == NSURLErrorCancelled else {
        completion(.failure(error))
        return
      }
    }
    task.resume()
    runningRequests[uuid] = task
    return uuid
  }
  
  func cancelLoad(_ uuid: UUID) {
    runningRequests[uuid]?.cancel()
    runningRequests.removeValue(forKey: uuid)
  }
}
