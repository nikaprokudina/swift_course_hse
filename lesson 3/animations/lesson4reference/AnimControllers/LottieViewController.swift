import UIKit
import Lottie

class LottieViewController: UIViewController {
    
    private var animButton: UIButton!
    private var lottieView: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupLayout()
    }

    private func setupLayout() {
        animButton = UIButton()
        view.addSubview(animButton)
        animButton.backgroundColor = .red
        animButton.addTarget(self, action: #selector(animateLottie), for: .touchUpInside)

        animButton.translatesAutoresizingMaskIntoConstraints = false
        
        animButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        animButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        
        lottieView = LottieAnimationView(asset: "AnikiHamster", bundle: .main)
        view.addSubview(lottieView)
        
        lottieView.loopMode = .playOnce
        
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        lottieView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottieView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lottieView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        lottieView.heightAnchor.constraint(equalTo: lottieView.widthAnchor).isActive = true
    }
    
    @objc private func animateLottie() {
        lottieView.play()
    }
}
