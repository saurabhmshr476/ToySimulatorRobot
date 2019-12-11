//
//  Simulator.swift
//  ToySimulatorRobot
//
//  Created by Saurabh Mishra on 10/12/19.
//  Copyright © 2019 Saurabh Mishra. All rights reserved.
//

import Foundation

class Simulator{
    
    
    let toyRobot:ToyRobot
    
    init(toyRobot:ToyRobot) {
        self.toyRobot = toyRobot
    }
    
    func executeCommand(command:String?){

        guard let command = command else{
            return
        }
        
        if command == "MOVE"{
            toyRobot.Move()
        }
        if command == "LEFT"{
            toyRobot.left()
        }
        if command == "RIGTH"{
            toyRobot.right()
        }
        if command == "REPORT"{
            print(toyRobot.report())
        }
        
        if command.contains("PLACE"){
            
            let placeArr = command.split(separator: " ")
            let tmpPlaceArr = placeArr[1].split(separator: ",")
            let xPos:Int = Int(String(tmpPlaceArr[0])) ?? 0
            let yPos:Int = Int(String(tmpPlaceArr[1])) ?? 0
            let dir = String(tmpPlaceArr[2])
            toyRobot.place(x: xPos, y: yPos, direction: dir)
        }

        
        

        
    }
}
