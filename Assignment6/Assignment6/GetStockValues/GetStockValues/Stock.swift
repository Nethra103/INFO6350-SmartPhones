//
//  Stock.swift
//  GetStockValues
//
//  Created by Nethra bhupathi on 3/4/21.
//

import Foundation


class Stock: Object {
    @objc dynamic var symbol : String = ""
    @objc dynamic var name : String = ""
    @objc dynamic var price : Float = 0.0
    
    override static func primaryKey() -> String? {
        return "name"
    }

}
