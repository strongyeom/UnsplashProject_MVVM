//
//  CalculateViewController.swift
//  UnsplashProject_MVVM
//
//  Created by 염성필 on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController {
    
    let viewModel = CalculateViewModel()

    @IBOutlet var firstTextFiled: UITextField!
    @IBOutlet var secondTextFiled: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextFiled.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextFiled.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
        
        viewModel.firstNumber.bind { number in
            self.firstTextFiled.text = number
            print("firstNumber changed \(number)")
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextFiled.text = number
            print("secondNumber changed \(number)")
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }
        // 여기서는 왜 value에 직접적으로 값을 넣어주지 않았냐?
        // var firstNumber = CustomObservable("10") 인스턴스를 생성할때 부터 넣어줌...
        
        // 텍스트 필드의 내용이 변경될때마다 업데이트 해주려면?
        
        
    }
    
    @objc func firstTextFieldChanged() {
        viewModel.firstNumber.value = firstTextFiled.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    
    @objc func secondTextFieldChanged() {
        viewModel.secondNumber.value = secondTextFiled.text
        viewModel.calculate()
    }
}

/*
 
    let person = Person("Jack")
    
    person.name = "Jack 1"
    
    person.name = "Jack 2"
    
    person.name = "Jack 3"
    
    person.introduce { value in
        self.resultLabel.text = value
        self.view.backgroundColor = [UIColor.yellow, UIColor.systemMint, UIColor.green].randomElement()!
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        person.name = "바나나 1초뒤 Jack"
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        person.name = "바나나 2초뒤 Jack"
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        person.name = "바나나 3초뒤 Jack"
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
        person.name = "바나나 4초뒤 Jack"
    }
    
   
    
}
 */
