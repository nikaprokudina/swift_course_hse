//
//  ProfileHeaderView.swift
//  profile_lesson3
//
//  Created by Nika on 1/16/24.
//

import UIKit
import SnapKit

protocol ProfileHeaderViewDeligate: AnyObject {
    func profileHeaderViewDidTapAvatar()
}

final class ProfileHeaderView: UIView {
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 138)
    }
    
    private lazy var avatarChangeRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(avatarDidTap))
        return recognizer
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = .lightGray
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "camera")
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.backgroundColor = UIColor.link.cgColor
        imageView.layer.borderWidth = 3
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(avatarChangeRecognizer)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
//        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var avatar: UIImage?{
        get {
            avatarImageView.image
        }
        set {
            avatarImageView.image = newValue
        }
    }
    
    weak var delegate: ProfileHeaderViewDeligate?
    
    
    
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private  func setupLayout(){
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(avatarImageView.snp.bottom).inset(-16)
        }
    }
    
    @objc private func avatarDidTap(){
        delegate?.profileHeaderViewDidTapAvatar()
    }
}
