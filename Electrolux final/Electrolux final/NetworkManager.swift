//
//  NetworkManager.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import Foundation
import SDWebImage

// swiftlint:disable:next line_length
let urlString = "https://flickr.com/services/rest/?method=flickr.photos.search&api_key=1a958538e8bb6e25cf246b9c8a98a8c2&tags=electrolux&format=json&nojsoncallback=1&extras=url_o"
// MARK: - Photos
struct Photos: Codable {
    let photos: PhotosClass
}

// MARK: - PhotosClass
struct PhotosClass: Codable {
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let urlO: String?

    enum CodingKeys: String, CodingKey {
        case urlO = "url_o"
    }
}

var photoArray = [Photo]()

let session = URLSession.shared
let decoder = JSONDecoder()

func getData(
    completed: @escaping () -> Void
) {
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        completed()
        return
    }

    session.dataTask(with: url) { data, _, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completed()
            return
        }

        guard let data = data else {
            print("No data")
            completed()
            return
        }

        do {
            let photos = try? JSONDecoder().decode(Photos.self, from: data)
            guard let items = photos?.photos.photo else {
                print("No photos found")
                completed()
                return
            }

            for item in items where item.urlO != nil {
                photoArray.append(item)
                if photoArray.count >= 20 {
                    break
                }
            }

            completed()

        }
    }.resume()
}
