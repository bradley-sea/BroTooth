//
//  ViewController.swift
//  BroTooth
//
//  Created by Bradley Johnson on 10/23/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
    
    var myCentralManager : CBCentralManager!
    let myCustomServiceUUID = CBUUID(string: "0F49D025-A0A5-4204-A531-E3AE90DF35D5")


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func didPressTeacherButton(sender: AnyObject) {
        self.myCentralManager = CBCentralManager(delegate: self, queue: nil)
        let fiveUUID = CBUUID(string: "Five")
         self.myCentralManager.scanForPeripheralsWithServices([myCustomServiceUUID], options: nil)
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        println("did update state")
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
        println("Discovered a device!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

