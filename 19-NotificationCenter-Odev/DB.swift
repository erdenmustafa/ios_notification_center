

import Foundation
import SQLite



class DB {
    
    var db:Connection!
    var tableCity = Table("cityTable")
    let cst = CityStruct()
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    func fncConnect() {
        let dbPath = path + "/cities.db"
        print("path : \(dbPath)")
        db = try! Connection(dbPath)
        // table create
        do {
            // table exists
            try db.scalar(tableCity.exists)
          
        }catch  {
            try! db.run(tableCity.create {  t in
                t.column(cst.cid, primaryKey: true)
                t.column(cst.title)
                
            })
           
        }
    }
    
    
    
    // all note list
    func allCityList() -> [CitySt] {
        var arr:[CitySt] = []
        let result = try! db.prepare(tableCity)
        for ct in result {
            let st = CitySt(cid: ct[cst.cid], title: ct[cst.title])
            arr.append(st)
        }
        return arr
    }
    
    // delete item
    func deleteItem(cid:Int) -> Int {
        let alias = tableCity.filter(cst.cid == cid)
        return try! db.run(alias.delete())
    }
    
   
    
}

