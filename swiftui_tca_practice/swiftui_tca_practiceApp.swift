//
//  swiftui_tca_practiceApp.swift
//  swiftui_tca_practice
//
//  Created by KS on 2024/06/13.
//

import SwiftUI
import ComposableArchitecture

@main
struct swiftui_tca_practiceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                }
            )
        }
    }
}
