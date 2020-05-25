//
//  QuadraticTimingCurve.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct QuadraticTimingFunction : DirectionalTimingFunctionType, FractionTimingFunctionType {
    
    public var curve: TimingCurve
    
    public func apply(fraction: Double, initialValue: Double, change: Double) -> Double {
        switch curve {
        case .easeIn:
            return change * fraction*fraction + initialValue
        case .easeOut:
            return -change * fraction*(fraction-2) + initialValue
        case .easeInOut:
            var fraction = fraction
            return (fraction*=2.0) < 1
                ? change/2 * fraction*fraction + initialValue
                : -change/2 * ((fraction-=1.0)*(fraction-2) - 1) + initialValue
        }
    }
    
    public init(curve: TimingCurve) {
        self.curve = curve
    }
        
}
