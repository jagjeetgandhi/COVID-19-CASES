//
//  ImageContainer.swift
//  CoronaUpdate
//
//  Created by jagjeet on 07/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct ImageContainer: View {
    @ObservedObject var remoteImageURL:RemoteImageURL

    
    init(imageURL:String) {
      remoteImageURL = RemoteImageURL(imageURL:imageURL)
   }
    var body: some View {

            Image(uiImage: self.remoteImageURL.image ?? ImageContainer.defaultImage!)
        .resizable()
        .frame(width:300,height: 200)
    }
    static var defaultImage = UIImage(systemName: "flag.fill")
}

struct ImageContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImageContainer(imageURL:"https://disease.sh/assets/img/flags/ar.png" )
    }
}
