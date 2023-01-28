//
//  randomEvents.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

func randomChance(probability: Int) -> Bool {
    
    if Int.random(in: 0...100) < probability {
        return true
    } else {
        return false
    }
        
   
}
