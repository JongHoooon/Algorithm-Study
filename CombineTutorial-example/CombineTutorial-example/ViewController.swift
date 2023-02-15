//
//  ViewController.swift
//  CombineTutorial-example
//
//  Created by JongHoon on 2023/02/03.
//

import UIKit
import CombineCocoa
import Combine

class ViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var navToNumbersBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navToNumbersBtn
            .tapPublisher
            .sink(receiveValue: {
                print("DEBUG -", #fileID, #function, #line, "-  ")
                
                let numbersVC = NumbersViewController.instantiate("Numbers")
                
                self.navigationController?.pushViewController(numbersVC, animated: true)
            })
            .store(in: &subscriptions)
    }
}

