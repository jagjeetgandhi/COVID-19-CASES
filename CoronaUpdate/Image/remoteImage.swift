//
//  remoteImage.swift
//  CoronaUpdate
//
//  Created by jagjeet on 07/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RemoteImageURL:ObservableObject {
    @Published var image:UIImage?
    var willChange = PassthroughSubject<Data,Never >()
    var data = Data() {
        willSet {
            willChange.send(data)
        }
    }
    init(imageURL:String) {
        guard let url = URL(string: imageURL) else{ return }
        URLSession.shared.dataTask(with: url) { (data,reponse , error) in
            guard let imagedata = data else { return }
            DispatchQueue.main.async {
                let loadedImage = UIImage(data:imagedata)
                self.image = loadedImage
            }
        }.resume()
    }
}
