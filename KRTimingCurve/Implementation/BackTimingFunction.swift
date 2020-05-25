//
//  BackTimingFunction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct BackTimingFunction : DirectionalTimingFunctionType, FractionTimingFunctionType {
    
    public var curve: TimingCurve
    
    public func apply(fraction: Double, initialValue: Double, change: Double) -> Double {
        switch curve {
        case .easeIn:
            let s = 1.70158
            return change * fraction*fraction*((s+1) * fraction - s) + initialValue

        case .easeOut:
            let s = 1.70158
            let fraction = fraction - 1
            let ex1 = (s+1) * fraction + s
            return change * (fraction * fraction * ex1 + 1) + initialValue
        case .easeInOut:
            var fraction = fraction
            var s = 1.70158 * 1.525
            return ((fraction*=2.0) < 1)
                ? change/2 * (fraction*fraction*((s+1)*fraction - s)) + initialValue
                : change/2 * ((fraction-=2)*fraction*(((s*=1.525)+1)*fraction + s) + 2) + initialValue
        }
    }
    
    public init(curve: TimingCurve) {
        self.curve = curve
    }
        
}
