//
//  AltimeterHelper.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 25/03/23.
//

import Foundation
import CoreMotion

struct CoreMotionListener {
    // Prevent CoreMotionListener from being created more than once.
    private init() {}
    
    static func StartListening(
        cameUp: @escaping () -> (),
        cameDown: @escaping () -> (),
        tiltedLeft: @escaping () -> (),
        tiltedRight: @escaping () -> ())
    {
        AltimeterListener.StartListening(cameUp: cameUp, cameDown: cameDown)
        MotionManagerListener.StartListening(tiltedLeft: tiltedLeft, tiltedRight: tiltedRight)
    }
    
    static func StopListening() {
        AltimeterListener.StopListening()
        MotionManagerListener.StopListening()
    }
}
