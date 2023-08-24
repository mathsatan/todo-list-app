//
//  TrafficLightsPresenter.swift
//  SampleApp
//
//  Created by max kryuchkov on 24.08.2023.
//

import UIKit

class TrafficLightsPresenter {
    
    weak var view: TrafficLightsView?
    
    // MARK: - Private properties
    
    private var index = 0
    private var timer: Timer?
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timerDidFireAction()
        }
    }
    
    // MARK: - Deinit
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}

extension TrafficLightsPresenter {
    
    func timerDidFireAction() {
        guard let trafficLight = TrafficLight(rawValue: index) else {
            return
        }
        view?.viewModel = .init(state: .value(trafficLight))
        index = (index + 1) % 3
    }
}

// MARK: - TrafficLight

enum TrafficLight: Int {
    case red
    case yellow
    case green
}
