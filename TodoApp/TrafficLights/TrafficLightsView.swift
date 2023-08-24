//
//  TrafficLightsView.swift
//  SampleApp
//
//  Created by max kryuchkov on 24.08.2023.
//

import Foundation

protocol TrafficLightsView: AnyObject {
    
    var viewModel: TrafficLightsViewController.ViewModel { get set }
}

extension TrafficLightsViewController {
    
    struct ViewModel {
        enum State {
            case `default`
            case value(TrafficLight)
        }
        
        let state: State
    }
}
