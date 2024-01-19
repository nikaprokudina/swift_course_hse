//
//  ProfileViewController.swift
//  profile_lesson3
//
//  Created by Nika on 12/26/23.
//

import UIKit
import SnapKit
import Photos

final class ProfileViewController: UIViewController {
    
    private lazy var navBar: UINavigationBar = {
        let number = UINavigationBar();
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .gray
        
        let item = UINavigationItem()
        item.title = "Profile"
        
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        item.setLeftBarButton(cancelItem, animated: true)
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        item.setRightBarButton(doneItem, animated: true)
        
        number.setItems([item], animated: true)
        
        return number
    }()
    
    private var header: ProfileHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupNavBar()
        setupHeader()
    }
    
    private func setupNavBar() {
        view.addSubview(navBar)
        //кложурка
        navBar.snp.makeConstraints { make in
            // сахарок
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            
//            make.leading.trailing.equalToSuperview()
//            make.leading.trailing.equalTo(view)
            
        }
    }
    
    private func setupHeader(){
        header =  ProfileHeaderView()
        
        view.addSubview(header)
        
        header.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).inset(-24)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(24)
        }
        header.delegate = self
    }
    
    @objc private func done() {

    }
    
    @objc private func cancel() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: ProfileHeaderViewDeligate {

    func profileHeaderViewDidTapAvatar() {
        requestPhotoLibraryAccess()
    }

    func requestPhotoLibraryAccess() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            switch status {
            case .authorized, .limited:
                DispatchQueue.main.async { [weak self] in
                    self?.showImagePicker()
                }
            default:
                break
            }
        }
    }

    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}

extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        header.avatar = image
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
