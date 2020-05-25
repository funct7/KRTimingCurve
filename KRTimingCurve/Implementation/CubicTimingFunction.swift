//
//  CubicTimingFunction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct CubicTimingFunction : DirectionalTimingFunctionType, FractionTimingFunctionType {
    
    public var curve: TimingCurve
    
    public func apply(fraction: Double, initialValue: Double, change: Double) -> Double {
        switch curve {
        case .easeIn:
            return change * fraction*fraction*fraction + initialValue
        case .easeOut:
            var fraction = fraction
            return change*((fraction-=1)*fraction*fraction + 1) + initialValue
        case .easeInOut:
            var fraction = fraction
            return (fraction*=2.0) < 1
                ? change/2 * fraction*fraction*fraction + initialValue
                : change/2 * ((fraction-=2)*fraction*fraction + 2) + initialValue
        }
    }
    
    public init(curve: TimingCurve) {
        self.curve = curve
    }
        
}
