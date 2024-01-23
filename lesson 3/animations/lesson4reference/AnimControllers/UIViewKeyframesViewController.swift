import UIKit

class UIViewKeyframesViewController: UIViewController {

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
        animButton.addTarget(self, action: #selector(animationFrame), for: .touchUpInside)
    }
    
    @objc private func animationFrame() {
        let start = self.animButton.frame
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) { [weak self] in
                self?.animButton.transform = CGAffineTransform(scaleX: 2, y: 2)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) { [weak self] in
                guard let `self` = self else { return }
                self.animButton.center = CGPoint(x: self.view.frame.minX, y: self.view.frame.minY)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) { [weak self] in
                guard let `self` = self else { return }
                self.animButton.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) { [weak self] in
                self?.animButton.frame = start
            }
        }, completion: nil)
    }
}
