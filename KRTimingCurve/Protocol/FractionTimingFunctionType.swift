//
//  FractionTimingFunctionType.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public protocol FractionTimingFunctionType : TimingFunctionType {
    
    func apply(
        fraction: Double,
        initialValue: Double,
        change: Double) -> Double
    
}
