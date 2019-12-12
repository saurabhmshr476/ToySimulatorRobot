//
//  ViewController.swift
//  ToySimulatorRobot
//
//  Created by Saurabh Mishra on 10/12/19.
//  Copyright © 2019 Saurabh Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ylabel: UILabel!
    
    @IBOutlet weak var input: UILabel!
    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var xlabel: UILabel!
    @IBOutlet weak var yDec: UIButton!
    @IBOutlet weak var yInc: UIButton!
    @IBOutlet weak var xDec: UIButton!
    @IBOutlet weak var xInc: UIButton!
    
    var commandArr = [String]()

    var inpStr = ""
    var outStr = "OUTPUT : "
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func yMinClicked(_ sender: Any) {
        var yInt = Int(ylabel.text!)
        if yInt != nil{
            if yInt != 0{
                yInt! -= 1
                
            }
        }
        ylabel.text = String(yInt!)
        

        //
        
    }
    @IBAction func xMinClicked(_ sender: Any) {
         var xInt = Int(xlabel.text!)
         if xInt != nil{
            if xInt != 0{
                xInt! -= 1
            }
             
         }
         xlabel.text = String(xInt!)
    }
    
    @IBAction func yPlusCliked(_ sender: Any) {
        var yInt = Int(ylabel.text!)
               if yInt != nil{
                
                   yInt! += 1
               }
               ylabel.text = String(yInt!)
    }
    @IBAction func xPlusClikced(_ sender: Any) {
        var xInt = Int(xlabel.text!)
               if xInt != nil{
                   xInt! += 1
               }
               xlabel.text = String(xInt!)
    }
    
    @IBAction func placeClicked(_ sender: Any) {
        
        let str = "PLACE \(xlabel.text!),\(ylabel.text!),\(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)?.uppercased() ?? "NORTH")"
        commandArr.append(str)
        
        upadateInput(str: str)
        
    }
    
    @IBAction func leftClicked(_ sender: Any) {
        commandArr.append("LEFT")
        upadateInput(str: "LEFT")
    }
    
    @IBAction func moveClicked(_ sender: Any) {
        commandArr.append("MOVE")
        upadateInput(str: "MOVE")
    }
    @IBAction func rightCliked(_ sender: Any) {
        commandArr.append("RIGHT")
        upadateInput(str: "RIGHT")
    }
    
    @IBAction func reportClicked(_ sender: Any) {
        upadateInput(str: "REPORT")
        commandArr.append("REPORT")
       input.text = inpStr
       let robot = ToyRobot()
       let simulator = Simulator(toyRobot: robot)
        for comm in commandArr{
            if comm == "REPORT"{

                output.text = robot.report()

            }else{
                simulator.executeCommand(command: comm)
                
            }
        }
        commandArr=[]
        inpStr = ""
        
    }
    
    func upadateInput(str:String){

         inpStr = """
        \(inpStr)
        \(str)
        """
        

    }
   
    
    
}



