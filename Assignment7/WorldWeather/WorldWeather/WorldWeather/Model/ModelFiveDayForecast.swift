//
//  ModelFiveDayForecast.swift
//  WorldWeather
//
//  Created by Sahithi Sarabu on 3/16/21.
//

import Foundation
import UIKit

class ModelFiveDayForecast {
    var weekday: String = ""
    var max: Int = 0
    var highImg: UIImage?
    var min: Int = 0
    var lowImg: UIImage?
    
init(weekday:String, max: Int, highImg: String, min: Int, lowImg: String ) {
        self.weekday = day
        self.max = high
        self.highImg = UIImage(named: highImg)
        self.min = low
        self.lowImg = UIImage(named: lowImg)
    }
}
