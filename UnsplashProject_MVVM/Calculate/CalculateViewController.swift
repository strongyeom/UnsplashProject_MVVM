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
     
        
        
        
    }

}
