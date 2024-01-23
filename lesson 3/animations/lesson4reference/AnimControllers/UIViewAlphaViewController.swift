//
//  UIViewAlphaViewController.swift
//  lesson4reference
//
//  Created by Emil Shpeklord on 02.01.2024.
//

import UIKit

class UIViewAlphaViewController: UIViewController {
    
    private var animButton: UIButton!

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
        animButton.addTarget(self, action: #selector(animationAlpha), for: .touchUpInside)
    }
    
    @objc private func animationAlpha(){
        let anim: () -> Void = { [weak self] in
            self?.animButton.layer.cornerRadius = 20
            self?.animButton.backgroundColor = .systemPink
            self?.animButton.frame = CGRect(x:20, y: 20, width: 200, height: 200)
            self?.animButton.alpha = 0
        }
        let completion: (Bool) -> Void = { [weak self] _ in
            self?.animButton.alpha = 1
        }
        UIView.animate(withDuration: 1, animations: anim, completion: completion)
    }
    

    

}
