//
//  ViewController.swift
//  les1
//
//  Created by Nika on 12/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var editText: UITextField!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    
    private var isRedOn: Bool {
        redSwitch.isOn
    }
    
//    значение слайдера
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeSlider.value = Float(modelLabel.font.pointSize)
        submit.layer.cornerRadius = 10
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        убираем клавиатуру при нажатии на экран
        editText.resignFirstResponder()
    }
    
    @IBAction func pushSubmit(_ sender: Any) {
        modelLabel.text = editText.text
        modelLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))
        modelLabel.textColor = isRedOn ? .red : .black
    }
    
    
}
