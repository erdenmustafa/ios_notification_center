

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
