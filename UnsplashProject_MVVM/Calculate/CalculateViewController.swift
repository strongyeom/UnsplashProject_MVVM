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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // VC에서 데이터를 가공하는게 아니라 단지 보여주기만 해야함 -> VM에서 데이터 가공 처리해애함
        firstTextFiled.text =  viewModel.firstNumber.value
        secondTextFiled.text =  viewModel.secondNumber.value
     
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

}
