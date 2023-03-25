//
//  DeviceMotionListener.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 25/03/23.
//

import Foundation
import CoreMotion

struct MotionManagerListener {
    // Prevent DeviceMotionListener from being created more than once.
    private init() {}
    
    private static let MOTION_MANAGER: CMMotionManager = CMMotionManager()
    
    private static var VERBOSE: Bool = false
    
    private static func handleTilt(
        gravity: CMAcceleration,
        tiltedLeft: @escaping () -> (),
        tiltedRight: @escaping () -> ())
    {
        let angle = atan2(gravity.x, gravity.y) - .pi
        
        if VERBOSE {
            print("angle \(angle)")
        }
        
        switch angle {
            // phone position is tilted to the left.
        case -5...(-4.5):
            tiltedLeft()
            // phone position is tilted to the right.
        case -2...(-1.5):
            tiltedRight()
        default:
            break
        }
    }
    
    private static func handleDeviceMotionUpdates(
        data: CMDeviceMotion?, error: Error?,
        tiltedLeft: @escaping () -> (),
        tiltedRight: @escaping () -> ())
    {
        guard error == nil else {
            print("Error: starting device motion updates \(error!)")
            return
        }
        
        guard let data = data else {
            print("Error: no device motion data available")
            return
        }
        
        let gravity = data.gravity
        
        if VERBOSE {
            print("z \(gravity.z)")
        }
        
        switch gravity.z {
            // phone position is vertical.
        case -0.5...0:
            handleTilt(gravity: data.gravity, tiltedLeft: tiltedLeft, tiltedRight: tiltedRight)
        default:
            break
        }
    }
    
    static func StartListening(
        tiltedLeft: @escaping () -> (),
        tiltedRight: @escaping () -> ())
    {
        if MOTION_MANAGER.isDeviceMotionAvailable {
            MOTION_MANAGER.deviceMotionUpdateInterval = 1
            
            MOTION_MANAGER.startDeviceMotionUpdates(
                to: .main,
                withHandler: {
                    (data, error) in
                    handleDeviceMotionUpdates(data: data, error: error, tiltedLeft: tiltedLeft, tiltedRight: tiltedRight)
                }
            )
        }
    }
    
    static func StopListening() {
        MOTION_MANAGER.stopDeviceMotionUpdates()
    }
    
    static func ToggleVerbose() {
        VERBOSE = !VERBOSE
    }
}
