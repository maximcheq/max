//
//  ViewController.swift
//  AnimationApp
//
//  Created by Максим  on 1.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    enum AnimationViewPosition: CaseIterable {
        case topLeftCorner
        case topRightCorner
        case bottomRightCorner
        case bottomLeftCorner
        case center
        
        func next() -> Self {
            let all = Self.allCases
            let idx = all.firstIndex(of: self)!
            let next = all.index(after: idx)
            return all[next == all.endIndex ? all.startIndex : next]
        }
    }
    
    var animationPosition: AnimationViewPosition = .center {
        didSet {
            animateToPosition(animationPosition)
        }
    }
    
    private let animationView = UIView()
    private let progressView = UIView()
    
    // MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: Setup
    
    private func setup () {
        setupButton()
        setupAnimationView()
    }
    
    private func setupButton() {
        let button = UIButton(type: .custom)
        button.setTitle("Animate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupAnimationView() {
        animationView.backgroundColor = .cyan
        animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animationView.center = view.center
        view.addSubview(animationView)
    }
    
    // MARK: IBAction
    
    @objc func buttonTapped() {
        animationPosition = animationPosition.next()
    }
    
    // MARK: Functions
    
    private func animateToPosition(_ position: AnimationViewPosition) {
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            switch position {
            case .topLeftCorner:
                self.animationView.frame.origin = CGPoint(x: 0, y: 0)
                //self.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            case .topRightCorner:
                self.animationView.frame.origin = CGPoint(x: self.view.frame.width-self.animationView.frame.width, y: 0)
                //self.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            case .bottomRightCorner:
                self.animationView.frame.origin = CGPoint(x: self.view.frame.width-self.animationView.frame.width, y: self.view.frame.height-self.animationView.frame.height)
                //self.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            case .bottomLeftCorner:
                self.animationView.frame.origin = CGPoint(x: 0, y: self.view.frame.height-self.animationView.frame.height)
                //self.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            case .center:
                self.animationView.center = self.view.center
            }
        }
    }
}
