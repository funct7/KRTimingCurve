//
//  DirectionalTimingFunctionType.swift
//  KRTimingCurve
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import Foundation

public protocol DirectionalTimingFunctionType : TimingFunctionType {
    
    var curve: TimingCurve { get set }
    
}
