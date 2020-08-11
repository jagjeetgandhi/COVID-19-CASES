//
//  Country.swift
//  CoronaUpdate
//
//  Created by jagjeet on 06/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct Country: View {
    @ObservedObject var net = Networking()
    @State var CountryData:String
    
    var body: some View {

        ZStack {
             GeometryReader { geo in
             Image("countryback")
             .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: geo.size.width, height: geo.size.height)
                 
             }.edgesIgnoringSafeArea(.all)
            VStack{
                ImageContainer(imageURL: net.countrydata.countryInfo.flag)
                    .padding(.bottom,20)
                    .border(Color.black,width: 5)
                    .shadow(color: .black, radius: 10, x: 300, y: 200)
                
                HStack{
                   LabelViews()
                    Spacer()
                    VStack{
                        Text("\(net.countrydata.cases)").modifier(spacing())
                        Text("\(net.countrydata.todayCases)").modifier(spacing())
                       Text("\(net.countrydata.deaths)").modifier(spacing())
                       Text("\(net.countrydata.todayDeaths)").modifier(spacing())
                       Text("\(net.countrydata.recovered)").modifier(spacing())
                     Text("\(net.countrydata.todayRecovered)").modifier(spacing())
                    }.padding(.trailing,10)
      }
                .navigationBarTitle(net.countrydata.country).foregroundColor(.white)
           }
                .onAppear() {
                    self.net.createUrl(urlString:"https://disease.sh/v3/covid-19/countries/\(self.CountryData)?yesterday=false&strict=false&allowNull=false",flag:1)
                    print(self.net.countrydata.todayCases)
            }
           
        }
    }
}

struct Country_Previews: PreviewProvider {
    static var previews: some View {
        Country(CountryData: "India")
    }
}
