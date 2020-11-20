//
//  CityStruct.swift
//  19-NotificationCenter-Odev
//
//  Created by emir kartal on 15.10.2020.
//

import Foundation
import SQLite

struct CityStruct {
    let cid = Expression<Int>("cid")
    let title = Expression<String>("title")
    
}

struct CitySt {
    let cid:Int
    let title:String
}
