//
//  Direction.swift
//  ToySimulatorRobot
//
//  Created by Saurabh Mishra on 10/12/19.
//  Copyright © 2019 Saurabh Mishra. All rights reserved.
//

import Foundation

class Direction{
    
    let North = "NORTH"
    let South = "SOUTH"
    let East = "EAST"
    let West = "WEST"
    var directions:[String]
    init() {
        directions = ["NORTH","EAST","SOUTH","WEST"]
    }
    
    func isValid(direction:String)->Bool{
        
        return directions.contains(direction)
    }
    
    func rotateLeft(direction:String) -> String? {
        if let curr = directions.firstIndex(of: direction){
            if curr - 1 >= 0{
                return directions[curr - 1]
            }
                return directions.last

        }
        return nil
    }
    
    func rotateRight(direction:String) -> String? {
        if let curr = directions.firstIndex(of: direction){

            if curr + 1 < directions.count{
                
                return directions[curr + 1]
                
            }

            return directions.last

        }
        return nil
    }

}
