//
//  swiftui_tca_practiceTests.swift
//  swiftui_tca_practiceTests
//
//  Created by KS on 2024/06/19.
//

import ComposableArchitecture
import XCTest


@testable import swiftui_tca_practice

@MainActor
final class CounterFeatureTests: XCTestCase {

    func testCounter() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }

        // 各アクションの送信後に状態がどのように変化したかをアサートする
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }

    func testTimer() async {
        let clock = TestClock()

        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
        }

        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = true
        }
        await clock.advance(by: .seconds(1))
        await store.receive(\.timerTick) {
            $0.count = 1
        }
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = false
        }
    }

    func testNumberFact() async {
      let store = TestStore(initialState: CounterFeature.State()) {
        CounterFeature()
      }

      await store.send(.factButtonTapped) {
        $0.isLoading = true
      }
      await store.receive(\.factResponse, timeout: .seconds(1)) {
        $0.isLoading = false
        $0.fact = "???"
      }
    }
}

