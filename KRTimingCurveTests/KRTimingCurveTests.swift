//
//  KRTimingCurveTests.swift
//  KRTimingCurveTests
//
//  Created by Joshua Park on 2020/05/25.
//  Copyright © 2020 Knowre. All rights reserved.
//

import XCTest
@testable import KRTimingCurve
import KRTimingFunction

class KRTimingCurveTests: XCTestCase {
    
    let rt = 0.5
    let b = 236.0
    let c = 5709.0
    
    func test_linear() {
        XCTAssertEqual(
            TimingFunction.linear(rt: rt, b: b, c: c),
            LinearTimingFunction().apply(fraction: rt, initialValue: b, change: c))
    }
    
    func test_sinusodial() {
        XCTAssertEqual(
            TimingFunction.easeInSine(rt: rt, b: b, c: c),
            SinusoidalTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutSine(rt: rt, b: b, c: c),
            SinusoidalTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutSine(rt: rt, b: b, c: c),
            SinusoidalTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }
    
    func test_quadratic() {
        XCTAssertEqual(
            TimingFunction.easeInQuad(rt: rt, b: b, c: c),
            QuadraticTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutQuad(rt: rt, b: b, c: c),
            QuadraticTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutQuad(rt: rt, b: b, c: c),
            QuadraticTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }
    
    func test_cubic() {
        XCTAssertEqual(
            TimingFunction.easeInCubic(rt: rt, b: b, c: c),
            CubicTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutCubic(rt: rt, b: b, c: c),
            CubicTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutCubic(rt: rt, b: b, c: c),
            CubicTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }
    
    func test_quartic() {
        XCTAssertEqual(
            TimingFunction.easeInQuart(rt: rt, b: b, c: c),
            QuarticTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutQuart(rt: rt, b: b, c: c),
            QuarticTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutQuart(rt: rt, b: b, c: c),
            QuarticTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }
    
    func test_quintic() {
        XCTAssertEqual(
            TimingFunction.easeInQuint(rt: rt, b: b, c: c),
            QuinticTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutQuint(rt: rt, b: b, c: c),
            QuinticTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutQuint(rt: rt, b: b, c: c),
            QuinticTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }

    func test_exponential() {
        XCTAssertEqual(
            TimingFunction.easeInExpo(rt: rt, b: b, c: c),
            ExponentialTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutExpo(rt: rt, b: b, c: c),
            ExponentialTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutExpo(rt: rt, b: b, c: c),
            ExponentialTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }

    func test_circ() {
        XCTAssertEqual(
            TimingFunction.easeInCirc(rt: rt, b: b, c: c),
            CircularTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutCirc(rt: rt, b: b, c: c),
            CircularTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutCirc(rt: rt, b: b, c: c),
            CircularTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }

    func test_back() {
        XCTAssertEqual(
            TimingFunction.easeInBack(rt: rt, b: b, c: c),
            BackTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutBack(rt: rt, b: b, c: c),
            BackTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutBack(rt: rt, b: b, c: c),
            BackTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))
    }
    
    func test_elastic() {
        let current = 2.0
        let duration = 5.4
        let rt = current / duration
        XCTAssertEqual(
            TimingFunction.easeInElastic(rt: rt, b: b, c: c, d: duration),
            ElasticTimingFunction(curve: .easeIn).apply(
                initialValue: b, change: c, currentTime: current, duration: duration))
        
        XCTAssertEqual(
            TimingFunction.easeOutElastic(rt: rt, b: b, c: c, d: duration),
            ElasticTimingFunction(curve: .easeOut).apply(
                initialValue: b, change: c, currentTime: current, duration: duration))
        
        XCTAssertEqual(
            TimingFunction.easeInOutElastic(rt: rt, b: b, c: c, d: duration),
            ElasticTimingFunction(curve: .easeInOut).apply(
                initialValue: b, change: c, currentTime: current, duration: duration))
    }
    
    func test_bounce() {
        XCTAssertEqual(
            TimingFunction.easeInBounce(rt: rt, b: b, c: c),
            BounceTimingFunction(curve: .easeIn).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeOutBounce(rt: rt, b: b, c: c),
            BounceTimingFunction(curve: .easeOut).apply(fraction: rt, initialValue: b, change: c))
        
        XCTAssertEqual(
            TimingFunction.easeInOutBounce(rt: rt, b: b, c: c),
            BounceTimingFunction(curve: .easeInOut).apply(fraction: rt, initialValue: b, change: c))

    }


}
