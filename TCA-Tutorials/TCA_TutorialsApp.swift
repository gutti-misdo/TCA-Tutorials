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
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }

    var body: some Scene {
        WindowGroup {
            CounterView(store: TCA_TutorialsApp.store)
        }
    }
}
