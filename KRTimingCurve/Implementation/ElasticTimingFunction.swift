//
//  ElasticTimingFunction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public struct ElasticTimingFunction : DirectionalTimingFunctionType, TimingFunctionType {
    
    public var curve: TimingCurve
    
    public func apply(
        initialValue b: Double,
        change c: Double,
        currentTime: Double,
        duration d: Double)
        -> Double
    {
        var rt = currentTime / d
        
        switch curve {
        case .easeIn:
            var s = 1.70158
            let p = d * 0.3
            var a = c
            if rt == 0.0 { return b }
            if rt == 1.0 { return b+c }
            if a < abs(c) { (a, s) = (c, p / 4.0) }
            else          { s = p / (2*Double.pi) * asin(c/a) }
            return -(a * pow(2, 10 * (rt-=1)) * sin((rt*d-s) * (2*Double.pi) / p)) + b
            
        case .easeOut:
            var s = 1.70158
            let p = d * 0.3
            var a = c
            if rt == 0.0 { return b }
            if rt == 1.0 { return b+c }
            if a < abs(c) { (a, s) = (c, p/4) }
            else          { s = p / (2*Double.pi) * asin(c/a) }
            return a * pow(2,-10 * rt) * sin((rt*d-s) * (2*Double.pi) / p) + c + b
        case .easeInOut:
            var s = 1.70158
            let p = d * 0.45
            var a = c
            if rt == 0.0 { return b }
            if (rt*=2.0) == 2.0 { return b+c }
            if a < abs(c) { (a, s) = (c, p/4) }
            else          { s = p / (2*Double.pi) * asin(c/a) }
            if rt < 1 { return -0.5 * (a * pow(2, 10 * (rt-=1)) * sin((rt*d-s) * (2*Double.pi) / p)) + b }
            return a * pow(2,-10 * (rt-=1)) * sin((rt*d-s) * (2*Double.pi) / p) * 0.5 + c + b
        }
    }
    
    public init(curve: TimingCurve) {
        self.curve = curve
    }
    
}
