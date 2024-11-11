import ComposableArchitecture
import Testing
@testable import TCA_Tutorials

@MainActor
struct CounterFeatureTests {
    @Test
    func timer() async {
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

    func numberFact() async {
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
