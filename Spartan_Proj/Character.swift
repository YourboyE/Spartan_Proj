//
//  Character.swift
//  Spartan_Proj
//
//  Created by YourboyE on 8/10/16.
//  Copyright © 2016 Edward Garcia. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp = 100
    private var _attackPwr = 10
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    init(attackPwr: Int, startingHp: Int){
        self._attackPwr = attackPwr
        self._hp = startingHp
    }
    
    func attemptAttack(attackPower: Int) -> Bool{
        self._hp -= attackPwr
        return true
    }
    
    var isAlive: Bool {
        get {
        if _hp <= 0 {
            return false
            } else {
        return true
            
        }
    }
    
}
}