//
//  HoleriteModel.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 19/11/22.
//

import Foundation

struct HoleriteModel {
    var result: [Holeritedata]
}

struct Holeritedata {
    var name: String?
    var value: String?
    var percentage: String?
    var isDiscount: Bool?
}
