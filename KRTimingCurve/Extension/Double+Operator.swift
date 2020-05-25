//
//  Double+Operator.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

extension Double {
    
    static func -= (lhs: inout Double, rhs: Double) -> Double {
        lhs = lhs - rhs
        return lhs
    }

    static func *= (lhs: inout Double, rhs: Double) -> Double {
        lhs = lhs * rhs
        return lhs
    }
    
}
