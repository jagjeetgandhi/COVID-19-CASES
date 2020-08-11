//
//  ContentView.swift
//  CoronaUpdate
//
//  Created by jagjeet on 25/07/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI


struct ContentView: View {
 
@ObservedObject var net = Networking()
@ObservedObject var country = Countries()
@State var selectedCountry:String = ""
@State var info = false
    init() {
       UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor.white]
    }
    
    var infoButton: some View {
        Button(action: { self.info.toggle()}) {
            Image(systemName: "info.circle")
                .imageScale(.large)
            .padding()
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
               
                  //  .edgesIgnoringSafeArea(.all)
                GeometryReader { geo in
                Image("trying")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                }.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("GLOBAL Records")
                        .font(Font.custom("PT Sans Bold", size: 24))
                        .foregroundColor(Color(red: 15, green: 76, blue: 117))
                        .padding(.top,20)
                    Spacer()
                    HStack{
                        LabelViews()
                        Spacer()
                        VStack{
                            Text("\(net.worldWideData.cases)").modifier(spacing())
                            Text("\(net.worldWideData.todayCases)").modifier(spacing())
                            Text("\(net.worldWideData.deaths)").modifier(spacing())
                            Text("\(net.worldWideData.todayDeaths)").modifier(spacing())
                            Text("\(net.worldWideData.recovered)").modifier(spacing())
                            Text("\(net.worldWideData.todayRecovered)").modifier(spacing())
                        }.padding(.trailing,10)
                    }
                    Spacer()
                    NavigationLink(destination: Country(CountryData:selectedCountry)) {
                        Picker("Select Country",selection:$selectedCountry){
                            ForEach(country.countries, id:\.self){ con in
                                Text(con).tag(con)
                                .font(Font.custom("PT Sans Bold", size: 24))
                                    .foregroundColor(.white)
                                
                            }
                        }
                    }
                        
                    .pickerStyle(WheelPickerStyle())
                    .padding(.bottom,40)
                    
                    
                    //  Text("->\(selectedCountry)")
                }
                    
                .navigationBarTitle("Corona Dashboard")
                .font(Font.custom("PT Sans Bold", size: 24))
                 .foregroundColor(Color(red: 15, green: 76, blue: 117))
                .navigationBarItems(trailing: infoButton)
                .sheet(isPresented:$info) {
                    InfoScreen()
                }
                
            }
                
            .onAppear() {
                self.net.createUrl(urlString: "https://disease.sh/v3/covid-19/all",flag:0)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


