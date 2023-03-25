//
//  AltimeterListener.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 25/03/23.
//

import Foundation
import CoreMotion

/**
 - Known Issues:
 1. After a while, CMAltitudeData.relativeAltitude.doubleValue will increase even if the phone is not moving.
    Possible causes:
    1. The relative altitude measurement is based on changes in air pressure, so it is possible that changes in the environment (such as changes in temperature or humidity) can affect the sensor calibration and cause it to give incorrect readings.
 */
struct AltimeterListener {
    // Prevent AltimeterListener from being created more than once.
    private init() {}
    
    private static let ALTIMETER: CMAltimeter = CMAltimeter()
    
    private static var VERBOSE: Bool = false
    
    private static var RELATIVE_ALTITUDE_THRESHOLD: Double = 0.15
    
    private static func handleRelativeAltitudeUpdates(
        data: CMAltitudeData?,
        error: Error?,
        cameUp: @escaping () -> (),
        cameDown: @escaping () -> ())
    {
        guard error == nil else {
            print("Error: starting relative altitude updates: \(error!)")
            return
        }
        
        guard let data = data else {
            print("Error: No relative altitude data available")
            return
        }
        
        if VERBOSE {
            print("relativeAltitude \(data.relativeAltitude.doubleValue)")
        }
        
        if data.relativeAltitude.doubleValue > RELATIVE_ALTITUDE_THRESHOLD {
            cameUp()
        } else if data.relativeAltitude.doubleValue < -RELATIVE_ALTITUDE_THRESHOLD {
            cameDown()
        }
    }
    
    static func StartListening(
        cameUp: @escaping () -> (),
        cameDown: @escaping () -> ())
    {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            ALTIMETER.startRelativeAltitudeUpdates(
                to: .main,
                withHandler: {
                    (data, error) in
                    handleRelativeAltitudeUpdates(data: data, error: error, cameUp: cameUp, cameDown: cameDown)
                }
            )
        }
    }
    
    static func StopListening() {
        ALTIMETER.stopRelativeAltitudeUpdates()
    }
    
    static func ToggleVerbose() {
        VERBOSE = !VERBOSE
    }
}
