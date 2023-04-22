//
//  ViewController.swift
//  textField
//
//  Created by 김하람 on 2023/04/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        initFunc()
    }

    func initFunc() {
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8060253263, blue: 0.819694221, alpha: 1)
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        textField.becomeFirstResponder() //화면에 들어가자 마자 키보드가 나오게 하는 것.
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드에 입력을 시작함!")
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if (textField.text?.count)! + string.count > 10 {
//            return false
//        } else {
//            return true
//        }
        if Int(string) != nil {
            return false
        } else {
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textField.text == "" {
            textField.placeholder = "입력해 !!"
            return false
        } else {
            return true
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드 입력을 마쳤숩니당!")
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

