//
//  ViewController.swift
//  lesson4reference
//
//  Created by Emil Shpeklord on 02.01.2024.
//

import UIKit

class MainViewController: UIViewController {

    enum AnimationTags: String, CaseIterable {
        case coreAnimation = "CoreAnimation"
        case uiviewAlpha = "UIView Alpha"
        case uiviewConstraints = "UIView Constraints"
        case keyframes = "UIView Keyframes"
        case uidynamicAnimator = "Dynamic Animator"
        case lottie = "Lottie"
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        for animation in AnimationTags.allCases {
            let button = getButton(name: animation.rawValue)
            stackView.addArrangedSubview(button)
        }
    }

    private func getButton(name: String) -> UIButton {
        let button = UIButton()
        button.setTitle(name, for: .normal)
        button.addTarget(self, action: #selector(chooseAnim(_ :)), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPink
        return button
    }
    
    @objc private func chooseAnim(_ button: UIButton) {
        guard let title = button.titleLabel?.text,
              let type = AnimationTags(rawValue: title) else { return }
        switch type {
        case .coreAnimation:
            present(CoreAnimationViewController(), animated: true)
        case .keyframes:
            present(UIViewKeyframesViewController(), animated: true)
        case .uidynamicAnimator:
            present(DynamicAnimatorViewController(), animated: true)
        case .uiviewAlpha:
            present(UIViewAlphaViewController(), animated: true)
        case .uiviewConstraints:
            present(UIViewConstraintsViewController(), animated: true)
        case .lottie:
            present(LottieViewController(), animated: true)
            
        }
    }
}

