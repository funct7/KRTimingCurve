//
//  ExponentialTimingFunction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct ExponentialTimingFunction : FractionTimingFunctionType {
    
    public var curve: TimingCurve
    
    public func apply(fraction: Double, initialValue: Double, change: Double) -> Double {
        switch curve {
        case .easeIn:
            return fraction == 0.0
                ? initialValue
                : change * pow(2, 10 * (fraction - 1)) + initialValue
        case .easeOut:
            return fraction == 1.0
                ? initialValue+change
                : change * (-pow(2, -10 * fraction) + 1) + initialValue
        case .easeInOut:
            if fraction == 0.0 { return initialValue }
            if fraction == 1.0 { return initialValue+change }
            
            var fraction = fraction
            return (fraction*=2.0) < 1
                ? change/2 * pow(2, 10 * (fraction - 1)) + initialValue
                : change/2 * (-pow(2, -10 * (fraction-=1)) + 2) + initialValue
        }
    }
    
    public init(curve: TimingCurve) {
        self.curve = curve
    }
        
}
