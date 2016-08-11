//
//  Enemy.swift
//  Spartan_Proj
//
//  Created by YourboyE on 8/10/16.
//  Copyright © 2016 Edward Garcia. All rights reserved.
//

import Foundation

class Enemy: Character{
    
    private var _name = "Giggles"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, attackPwr: Int, hp: Int) {
        self.init(attackPwr: attackPwr, startingHp: hp)
        _name = name
    }
    
}