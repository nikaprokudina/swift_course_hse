//
//  UIValidate.swift
//  profile_lesson3
//
//  Created by Nika on 12/26/23.
//

import UIKit

final class UIValidatableTextField: UIStackView {
    // Colors
    private let validTextFieldColor: UIColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
    private let invalidTextFieldColor: UIColor = UIColor(red: 0.89, green: 0.411, blue: 0.345, alpha: 0.12)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private lazy var textField: UIInsetedTextField = {
        let textField = UIInsetedTextField()
        textField.backgroundColor = validTextFieldColor
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var invalidLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 12, weight: .regular)
        lable.textColor = .red
        lable.isHidden = true
        return lable
    }()

//    add true
    var isValid: Bool {
//        property observer выполняется во время редачки текста например
//        срабатывает после того, как добавили новое значение
        didSet{
            invalidLable.isHidden = isValid
            textField.backgroundColor = isValid ? validTextFieldColor : invalidTextFieldColor
        }
    }
    
    var text:String? {
        textField.text
    }
    
    init() {
        isValid = true
        super.init(frame: .zero)
        setupLayout()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String, placeholder: String, invalidTitle: String) {
        titleLabel.text = title
        textField.placeholder = placeholder
        invalidLable.text = invalidTitle
        setupLayout()
    }
    
    
    private func setupLayout(){
        backgroundColor = .white
        //расстояние между элементами стек вьюхи
        spacing = 16
        axis = .vertical
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(textField)
        addArrangedSubview(invalidLable)
        setCustomSpacing(8, after: textField)
        
        
    }
}
