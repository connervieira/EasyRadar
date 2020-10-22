//
//  ViewController.swift
//  EasyRadar
//
//  Created by Conner Vieira on 6/25/19.
//  Copyright © 2019 V0LT. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var Distance: NSTextField!
    @IBOutlet weak var Temperature: NSTextField!
    @IBOutlet weak var Delay: NSTextField!
    
    @IBOutlet weak var Output: NSTextField!

    @IBAction func Calculate(_ sender: Any) {
        var Kelvin = (((5/9)*(Temperature.doubleValue-32))+273.15); // Convert from Fahrenheit to Celcius, then to Kelvin
        var SoundSpeed = (1.6878099*(643.855*(pow((Kelvin/273.15), 0.5)))); // Calculate Air Pressure based on the temperature in Kelvin, then use air pressure to deteremine the speed of sound at that location
        
        var TrueDelay = Delay.doubleValue-(Distance.doubleValue/SoundSpeed); // Calculate how long it took for the projectile to hit the target after compensating for delay of sound traveling
        
        var Speed = Distance.doubleValue/TrueDelay; // Calculate the speed of the projectile based on how long it took to reach the target given the distance
        
        Output.stringValue = String(Speed); // Display the output to the user
    }
}

