//
//  Drink.swift
//  First Brew
//
//  Created by Adrien Maranville on 7/26/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Hashable {
    case hot
    case cold
    case filter
}

struct Drink: Identifiable, Hashable {
    var id: String
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var price: Double
}

func drinkDictionaryFrom(drink: Drink) -> [String: Any] {
    return NSDictionary(objects: [
        drink.id,
        drink.name,
        drink.imageName,
        drink.category.rawValue,
        drink.description,
        drink.price
    ], forKeys: [
        kID as NSCopying,
        kNAME as NSCopying,
        kIMAGENAME as NSCopying,
        kCATEGORY as NSCopying,
        kDESCRIPTION as NSCopying,
        kPRICE as NSCopying
    ]) as! [String : Any]
}
