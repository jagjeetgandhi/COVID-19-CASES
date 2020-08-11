//
//  Networking.swift
//  CoronaUpdate
//
//  Created by jagjeet on 06/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import Foundation
import SwiftUI

class Networking:ObservableObject {
   //  @Published var cInfo = countryinfo(iso: "", flag: "")
    @Published var worldWideData = worldwide(cases: 0, todayCases: 0, deaths: 0, todayDeaths: 00, recovered: 00, todayRecovered: 0)
    @Published var countrydata = CountryData(country: "", cases: 0, todayCases: 0, deaths: 0, todayDeaths: 00, recovered: 0, todayRecovered: 0, countryInfo: countryinfo(iso3: "", flag: ""))
   
    
    func createUrl(urlString:String,flag:Int){
        if let url = URL(string: urlString){
            print(url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url){ (data,response,error) in
            if error == nil {
                if let api = data {
                    if flag == 0
                    {
                self.parseData(Apidata:api)
                    }
                    else
                    {
                        self.getData(apidata: api)
                       
                    }
            }
            }
            
        }
            task.resume()
    }
    }
    
    func parseData(Apidata:Data){

        let decoder = JSONDecoder()
        do {
       let world = try decoder.decode(worldwide.self, from: Apidata)
            print(world.cases)
            let WorldData = worldwide(cases: world.cases, todayCases: world.todayCases, deaths: world.deaths, todayDeaths: world.todayDeaths, recovered: world.recovered, todayRecovered: world.todayRecovered)
            DispatchQueue.main.async {
                self.worldWideData = WorldData
            }
            
        } catch {
            print("error while networking")
        }
    }
    func getData(apidata:Data){
        let decoder = JSONDecoder()
        do {
            print("this is country method")
            let country = try decoder.decode(CountryData.self, from: apidata)
            print(country.cases)
            print(country.todayDeaths)
           print(country.countryInfo.flag)
            let countryobj = CountryData(country: country.country, cases: country.cases, todayCases: country.todayCases, deaths: country.deaths, todayDeaths: country.todayDeaths, recovered: country.recovered,todayRecovered:country.todayRecovered, countryInfo: country.countryInfo)
            DispatchQueue.main.async {
                self.countrydata = countryobj
            }
        } catch {
            print("error while networking")
        }
    }
}
