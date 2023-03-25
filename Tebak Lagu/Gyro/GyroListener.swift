////
////  GyroListener.swift
////  Tebak Lagu
////
////  Created by Jason Rich Darmawan Onggo Putra on 24/03/23.
////
//
//import Foundation
//import CoreMotion
//
//struct GyroListener {
//    private var motionManager: CMMotionManager = CMMotionManager()
//    
//    func startAccelerometerUpdates(thrownDown: () -> (), thrownUp: () -> ()) {
//        if motionManager.isAccelerometerAvailable {
//            motionManager.accelerometerUpdateInterval = 0.1 // update interval in seconds
//            
//            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
//                guard let data = data else { return }
//                
//                let acceleration = data.acceleration
//                
//                // Check if the phone is thrown down or thrown up
//                if acceleration.y > 0.8 {
//                    thrownDown()
//                } else if acceleration.y < -0.8 {
//                    thrownUp()
//                }
//            }
//        }
//    }
//}
