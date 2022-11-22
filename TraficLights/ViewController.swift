//
//  ViewController.swift
//  TraficLights
//
//  Created by Philip Noskov on 22.11.2022.
//

import UIKit

enum CurrentLight {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet var colorViews: [UIView]!
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private var lightOn = 1.0
    private var lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        colorViews.forEach { $0.layer.cornerRadius = $0.frame.width / 2}
    }

    @IBAction func startButtonDidTapped() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            colorViews[0].alpha = lightOn
            currentLight = .yellow
            colorViews[2].alpha = lightOff
        case .yellow:
            colorViews[1].alpha = lightOn
            currentLight = .green
            colorViews[0].alpha = lightOff
        case .green:
            colorViews[2].alpha = lightOn
            currentLight = .red
            colorViews[1].alpha = lightOff
        }
    }
    
    private func setupUI() {
        colorViews.forEach { $0.alpha = lightOff }
        
        startButton.layer.cornerRadius = 10
        startButton.setTitle("START", for: .normal)
    }
    
}

