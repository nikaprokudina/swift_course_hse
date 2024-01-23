//
//  CoreAnimationViewController.swift
//  lesson4reference
//
//  Created by Emil Shpeklord on 02.01.2024.
//

import UIKit

class CoreAnimationViewController: UIViewController {

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
            animButton.addTarget(self, action: #selector(animateTransform), for: .touchUpInside)
            animButton.addTarget(self, action: #selector(animatedPolice), for: .touchUpInside)
            animButton.addTarget(self, action: #selector(animatePosition), for: .touchUpInside)
        }
    
    @objc private func animateTransform() {
        let anim = CABasicAnimation(keyPath: "transform.scale.x")
        anim.fromValue = 1
        anim.toValue = 2
        anim.duration = 0.5
        anim.repeatCount = 4
        anim.autoreverses = true
        anim.delegate = self
        animButton.layer.add(anim, forKey: "Transform")
    }
    
    @objc private func animatedPolice(){
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 1
        anim.toValue = 0.1
        anim.duration = 1
        anim.repeatCount = 4
        anim.autoreverses = true
        
        let bgAnim = CABasicAnimation(keyPath: "backgroundColor")
        bgAnim.fromValue = UIColor.red.cgColor
        bgAnim.toValue = UIColor.blue.cgColor
        bgAnim.duration = 0.5
        bgAnim.repeatCount = 4
        bgAnim.autoreverses = true
        
        animButton.layer.add(anim, forKey: "Opacity")
        animButton.layer.add(bgAnim, forKey: "BgColor")
        
    }
    
    @objc private func animatePosition() {
            let anim = CABasicAnimation(keyPath: "position")
            anim.fromValue = CGPoint.zero
            anim.toValue = view.center
            anim.duration = 5
            anim.repeatCount = 4
            anim.autoreverses = true
            animButton.layer.add(anim, forKey: "animatePosition")
        }
}

extension CoreAnimationViewController: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("Started")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished isFinished: Bool) {
        if isFinished {
            print("Finished")
        } else {
            print("Cancelled")
        }
    }
}
