//
//  NetworkManager.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import Foundation

let urlString = "https://flickr.com/services/rest/?method=flickr.photos.search&api_key=1a958538e8bb6e25cf246b9c8a98a8c2&tags=electrolux&format=json&nojsoncallback=1&extras=url_o"

// MARK: - Photos
struct Photos: Codable {
    let photos: PhotosClass
    let stat: String
}

// MARK: - PhotosClass
struct PhotosClass: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let urlO: String?
    var imageData: Data?
    let heightO, widthO: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
        case urlO = "url_o"
        case heightO = "height_o"
        case widthO = "width_o"
    }
}

var photoArray = [Photo]()


let session = URLSession.shared
let decoder = JSONDecoder()

func returnUrl(url: String?) -> String {
    if let url = url {
        return url
    } else {
        return "https://live.staticflickr.com/65535/52370903050_756daefe2c_o.jpg"
    }
   
}

func getData(completed: @escaping ()->()) {
    guard let url = URL(string: urlString) else {
        print("Error URL", urlString)
        completed()
        return
    }
    
    session.dataTask(with: url) { data, response, error in
        if let error = error {
            print("error:", error.localizedDescription)
        }
        guard let data = data else {
            print("No data")
            return
        }
        do {
       
            
            let photos = try? JSONDecoder().decode(Photos.self, from: data)
//            photoArray = photos?.photos.photo ?? []
//            photoArray.append((photos?.photos.photo[0])!)
            for i in 0..<20 {
                
                if let item = photos?.photos.photo[i] {
                    photoArray.append(item)
                }
                
            }
         
            print(photoArray.count)
        }
        completed()
    }.resume()
}
