//
//  Extensions.swift
//  First Brew
//
//  Created by Adrien Maranville on 8/7/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%0.f", self) : String(self)
    }
}
