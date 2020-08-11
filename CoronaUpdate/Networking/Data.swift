//
//  Data.swift
//  CoronaUpdate
//
//  Created by jagjeet on 06/08/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import Foundation

struct worldwide:Decodable {
    var cases: Int
    var todayCases:Int
    var deaths:Int
    var todayDeaths:Int
    var recovered:Int
    var todayRecovered:Int
    
    
}
struct CountryData:Decodable {
    
    var country:String
    var cases:Int
    var todayCases:Int
    var deaths:Int
    var todayDeaths:Int
    var recovered:Int
    var todayRecovered:Int
    
  var countryInfo:countryinfo
    
}
struct  countryinfo:Decodable {
    var iso3:String
    var flag:String
}
