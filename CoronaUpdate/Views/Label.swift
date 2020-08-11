//
//  Label.swift
//  CoronaUpdate
//
//  Created by jagjeet on 06/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import Foundation
import SwiftUI

struct LabelViews: View {
    var body: some View {
        VStack{
            Text("Total Cases     ").modifier(spacing())
            Text("Today Cases     ").modifier(spacing())
            Text("Total Deaths    ").modifier(spacing())
            Text("Today Deaths    ").modifier(spacing())
            Text("Total Recovered ").modifier(spacing())
            Text("Today Recovered ").modifier(spacing())
        }.padding(.leading,10)
    }
}

struct spacing : ViewModifier {
    func body(content: Content) -> some View {
        return content
        .padding(.bottom,20)
        .font(Font.custom("PT Sans Bold", size: 24))
       .foregroundColor(Color(red: 15, green: 76, blue: 117))
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
    LabelViews()
    }
}
