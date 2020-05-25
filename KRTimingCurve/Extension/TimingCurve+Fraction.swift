//
//  TimingFunctionType+Fraction.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public extension TimingFunctionType where Self : FractionTimingFunctionType {
    
    func apply(
        initialValue: Double,
        change: Double,
        currentTime: Double,
        duration: Double)
        -> Double
    {
        return apply(
            fraction: currentTime / duration,
            initialValue: initialValue,
            change: change)
    }
    
}
