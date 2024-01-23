//
//  UIViewConstraintsViewController.swift
//  lesson4reference
//
//  Created by Emil Shpeklord on 02.01.2024.
//

import UIKit

class UIViewConstraintsViewController: UIViewController {

    private var animButton: UIButton!
    private var leadingConstrain: NSLayoutConstraint!
    private var centerConstrain: NSLayoutConstraint!
    private var heightConstrain: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupLayout()
    }

    private func setupLayout() {
        animButton = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        view.addSubview(animButton)
        animButton.center = view.center
        animButton.backgroundColor = .red
        animButton.addTarget(self, action: #selector(animateConstrain), for: .touchUpInside)
        
        animButton.translatesAutoresizingMaskIntoConstraints = false
        
        animButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heightConstrain = animButton.heightAnchor.constraint(equalToConstant: 200)
        heightConstrain.isActive = true
        
        leadingConstrain = animButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        leadingConstrain.isActive = true
        
        centerConstrain = animButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        centerConstrain.isActive = true
    }

    
    @objc private func animateConstrain() {
        heightConstrain.constant = 150
        leadingConstrain.constant = 40
        centerConstrain.constant = -80
        
        // Make it green
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.animButton.backgroundColor = .green
        }
    }

}
