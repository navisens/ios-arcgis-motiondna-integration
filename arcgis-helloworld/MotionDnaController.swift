//
//  MotionDnaController.swift
//  arcgis-ios-sdk-samples
//
//  Created by Lucas Mckenna on 9/7/18.
//  Copyright © 2018 Esri. All rights reserved.
//

import Foundation
import MotionDnaSDK

class MotionDnaController : MotionDnaSDK
{
//    var m : MGLMapView?
    var receiver_ : MotionDnaLocationDisplay?
    func start(_ receiver : MotionDnaLocationDisplay){
        // "Enter your Navisens developer key, please inquire it here: https://navisens.com/"
        runMotionDna("YOURDEVELOPERKEY", receiver: self)
        setExternalPositioningState(HIGH_ACCURACY)
        receiver_=receiver
    }
    
    override func receive(_ motionDna: MotionDna!) {
        receiver_?.receive(motionDna)
    }
    
    override func reportError(_ error: ErrorCode, withMessage message: String!) {
        // Error
        if (error==AUTHENTICATION_FAILED)
        {
            receiver_?.authFailure()
        }
    }
}
