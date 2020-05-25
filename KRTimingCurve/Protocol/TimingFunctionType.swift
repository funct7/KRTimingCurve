//
//  TimingFunctionType.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public protocol TimingFunctionType {
    
    /**
     - Precondition: `duration > 0`
     */
    func apply(
        initialValue: Double,
        change: Double,
        currentTime: Double,
        duration: Double) -> Double
    
}
