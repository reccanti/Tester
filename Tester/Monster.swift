//
//  Monster.swift
//  Tester
//
//  Created by Benjamin Wilcox on 5/8/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

class Monster {
    
    // MARK: - ivars
    var name: String {
        didSet {
           name = validateName(name)
        }
    }
    var level: Int {
        didSet {
            level = validateLevel(level)
        }
    }
    var hitpoints: Int {
        didSet {
            hitpoints = validateHitpoints(hitpoints)
        }
    }
    var isAlive: Bool {
        return hitpoints > 0
    }
    
    
    /**
     * Initialize the Monster class
     */
    init(name: String, level: Int, hitpoints: Int) {
        
        // set initial values
        self.name = name
        self.level = level
        self.hitpoints = hitpoints
        
        // validate values
        self.name = validateName(name)
        self.level = validateLevel(level)
        self.hitpoints = validateHitpoints(hitpoints)
    }
    
    /**
     * slay the monster by setting its hitpoints to zero
     */
    func slay() {
        hitpoints = 0
    }
    
    // MARK: - validation
    
    /**
     * Format a given string so that it does not
     * contain commas
     */
    private func validateName(_ str:String)->String {
        return str.replacingOccurrences(of: ",", with: "")
    }
    
    /**
     * validate the level so that it will always be
     * greater than or equal to 1 and always be less
     * than or equal to 100
     */
    private func validateLevel(_ lvl:Int)->Int {
        if lvl < 1 {
            return 1
        } else if lvl > 100 {
            return 100
        }
        return lvl
    }
    
    /**
     * validate hitpoints so that they will always be
     * greater or equal to 0 and always be less than
     * or equal to level * 20
     */
    private func validateHitpoints(_ hp:Int)->Int {
        if hp < 0 {
            return 0
        } else if hp > level * 20 {
            return level * 20
        }
        return hp
    }
}
