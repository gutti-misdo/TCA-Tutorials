//
//  TCA_TutorialsApp.swift
//  TCA-Tutorials
//
//  Created by sakaguchi.hayato on 2024/10/30.
//
import ComposableArchitecture
import SwiftUI

@main
struct TCA_TutorialsApp: App {
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
