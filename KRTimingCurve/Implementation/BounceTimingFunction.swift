//
//  BounceTimingFunction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct BounceTimingFunction : FractionTimingFunctionType {
    
    public var curve: TimingCurve
    
    public func apply(
        fraction rt: Double,
        initialValue b: Double,
        change c: Double)
        -> Double
    {
        switch curve {
        case .easeIn:
            var copy = self
            copy.curve = .easeOut
            return c - copy.apply(fraction: rt, initialValue: b, change: c)

        case .easeOut:
            var rt = rt
            if rt < 1/2.75 {
                return c * (7.5625*rt*rt) + b
            } else if rt < 2/2.75 {
                return c * (7.5625*(rt-=(1.5/2.75))*rt + 0.75) + b
            } else if rt < 2.5/2.75 {
                return c * (7.5625*(rt-=(2.25/2.75))*rt + 0.9375) + b
            } else {
                return c * (7.5625*(rt-=(2.625/2.75))*rt + 0.984375) + b
            }
        case .easeInOut:
            var copy = self
            copy.curve = rt < 0.5 ? .easeIn : .easeOut
            return rt < 0.5
                ? copy.apply(fraction: rt*2, initialValue: 0, change: c) * 0.5 + b
                : copy.apply(fraction: rt*2 - 1, initialValue: 0, change: c) * 0.5 + c*0.5 + b
        }
    }
    
    public init(curve: TimingCurve) {
        self.curve = curve
    }
        
}
