//
//  UIViewController+Ext.swift
//  CombineTutorial-example
//
//  Created by JongHoon on 2023/02/03.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static func instantiate(_ storyboardName: String) -> Self
    
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate(_ storyboardName: String) -> Self {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}

extension UIViewController: StoryBoarded {}
