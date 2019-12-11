//
//  ToyRobot.swift
//  ToySimulatorRobot
//
//  Created by Saurabh Mishra on 10/12/19.
//  Copyright © 2019 Saurabh Mishra. All rights reserved.
//

import Foundation

class ToyRobot {
    
    var maxX = 5
    var maxY = 5
    var X:Int?
    var Y:Int?
    var Facing:String?
    
    init() {
       
    }
    func getX()->Int?{
        return self.X
    }
    func getY()->Int?{
        return self.Y
    }
    
    func place(x:Int,y:Int,direction:String){
        
        if isValid(x: x, y: y, direction: direction) {
            X=x
            Y=y
            Facing = direction
        }
        
    }
    
    func Move(){
        guard let facing = Facing, let posX = X, let posY = Y  else {
            return
        }
        if facing == "NORTH" && isValid(x: posX, y: posY + 1, direction: facing){
            Y! += 1
        }
        
        if facing == "EAST" && isValid(x: posX+1, y: posY, direction: facing){
            X! += 1
        }
        
        if facing == "SOUTH" && isValid(x: posX, y: posY-1, direction: facing){
            Y! -= 1
        }
        if facing == "WEST" && isValid(x: posX-1, y: posY, direction: facing){
            X! -= 1
        }
    }
    
    func left(){
        
        guard let facing = Facing else {
            return
        }
        let dirn = Direction()
        if dirn.isValid(direction: facing){
            Facing = dirn.rotateLeft(direction: facing)
        }
    }
    
    
    func right(){
        
        guard let facing = Facing else {
            return
        }
        let dirn = Direction()
        if dirn.isValid(direction: facing){
            Facing = dirn.rotateRight(direction: facing)
        }
    }
    
    func report()->String{
        guard let facing = Facing, let posX = X, let posY = Y  else {
            return "Invalid command"
        }
        if isValid(x: posX, y: posY, direction: facing){
            return "\(posX),\(posY),\(facing)"
        }
        
        return "Invalid command"
    }
    
    func isValid(x:Int,y:Int,direction:String) -> Bool {
        let dirn = Direction()
        let xIsValid = x>=0 && x<maxX
        let yIsValid = y>=0 && y<maxY
        return xIsValid && yIsValid && dirn.isValid(direction: direction)
    }
}
