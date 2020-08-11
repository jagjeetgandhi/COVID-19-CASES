//
//  InfoScreen.swift
//  CoronaUpdate
//
//  Created by jagjeet on 07/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct InfoScreen: View {
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("trying")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                
            }.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 20){
                Text("for IOS 13.0 and above ").modifier(spacing())
                    .padding(.top,30)
                Text("Corona Updates ~ 1.0").modifier(spacing())
      
                Text("This Application Updates you about the Global Records of CORONA Cases WorldWide and for any specific Country as well . ")
                .modifier(spacing())
                 Spacer()
                Text("Developed by :- Jagjeet Gandhi")
                    .modifier(spacing())
                    
                .padding(.bottom,50)
               
            }.padding(.top,20)
        }
    }
}
struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}

