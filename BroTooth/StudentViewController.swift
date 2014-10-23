//
//  StudentViewController.swift
//  BroTooth
//
//  Created by Bradley Johnson on 10/23/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit
import CoreBluetooth
class StudentViewController: UIViewController, CBPeripheralManagerDelegate {
    
    var myPeripheralManager : CBPeripheralManager!
    let myCustomServiceUUID = CBUUID(string: "0F49D025-A0A5-4204-A531-E3AE90DF35D5")
    let myCustomCharacteristicUUID = CBUUID(string: "AF1D039A-154D-43C7-A2E6-B7C7D547092C")

    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor.greenColor()
        
        self.myPeripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func peripheralManager(peripheral: CBPeripheralManager!, didAddService service: CBService!, error: NSError!) {
        println("added service")
        
        if error != nil {
            println(error.localizedDescription)
        } else {
            self.myPeripheralManager.startAdvertising(["MyKey" : "This works!"])
        }
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        if error != nil {
            println(error.localizedDescription )
        } else {
            println("advertising")
        }
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        println("peripheral Manager did update state!")
        var myService = CBMutableService(type: myCustomServiceUUID, primary: true)
        self.myPeripheralManager.addService(myService)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressHelpButton(sender: AnyObject) {
        self.view.backgroundColor = UIColor.redColor()
    }

    @IBAction func didPressIGetItButton(sender: AnyObject) {
        self.view.backgroundColor = UIColor.greenColor()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
