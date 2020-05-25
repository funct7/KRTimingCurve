//
//  SineTimingFunction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public enum SineTimingFunction : FractionTimingFunction {
    
    case easeIn
    case easeOut
    case easeInOut
    
    public func apply(fraction: Double, initialValue: Double, change: Double) -> Double {
        switch self {
        case .easeIn:
            return -change * cos(fraction * (Double.pi/2.0)) + change + initialValue
        case .easeOut:
            return change * sin(fraction * (Double.pi/2.0)) + initialValue
        case .easeInOut:
            return -change/2 * (cos(Double.pi*fraction) - 1) + initialValue
        }
    }
        
}
