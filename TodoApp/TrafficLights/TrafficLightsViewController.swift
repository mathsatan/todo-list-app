//
//  TrafficLightsViewController.swift
//  SampleApp
//
//  Created by max kryuchkov on 24.08.2023.
//

import UIKit

final class TrafficLightsViewController: UIViewController, TrafficLightsView {
    
    var presenter: TrafficLightsPresenter!
    var viewModel = ViewModel(state: .default) {
        didSet {
            render(viewModel: viewModel)
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet private var redView: UIView!
    @IBOutlet private var yellowView: UIView!
    @IBOutlet private var greenView: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        presenter.viewDidLoad()
    }
}

// MARK: - Private methods

private extension TrafficLightsViewController {
    
    func configureView() {
        
        redView.layer.cornerRadius = 50.0
        yellowView.layer.cornerRadius = 50.0
        greenView.layer.cornerRadius = 50.0
        
        redView.backgroundColor = .systemPink
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        
        addBorderLayer(to: redView)
        addBorderLayer(to: yellowView)
        addBorderLayer(to: greenView)
        
        hideAllViews()
    }
    
    func hideAllViews() {
        redView.alpha = 0.0
        yellowView.alpha = 0.0
        greenView.alpha = 0.0
    }
    
    func addBorderLayer(to view: UIView) {
        view.layer.sublayers?.removeAll()
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(ovalIn: view.bounds).cgPath
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.borderWidth = 3.0
        view.layer.addSublayer(layer)
    }
    
    func switchLight(trafficLight: TrafficLight) {
        hideAllViews()
        switch trafficLight {
        case .green:
            greenView.alpha = 1.0
        case .yellow:
            yellowView.alpha = 1.0
        case .red:
            redView.alpha = 1.0
        }
    }
    
    func render(viewModel: ViewModel) {
        switch viewModel.state {
        case .default:
            break
        case .value(let trafficLight):
            UIView.animate(withDuration: 0.5) {
                self.switchLight(trafficLight: trafficLight)
            }
        }
    }
}
