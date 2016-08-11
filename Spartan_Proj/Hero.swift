//
//  Hero.swift
//  Spartan_Proj
//
//  Created by YourboyE on 8/10/16.
//  Copyright © 2016 Edward Garcia. All rights reserved.
//

import Foundation

class Hero: Character {

    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
       
    }
   
    
    convenience init(name: String, attackPwr: Int, hp: Int){
    self.init(attackPwr: attackPwr, startingHp: hp)
        _name = name
    }

}