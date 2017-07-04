//
//  ButtonFactory.swift
//  TinderLikeTutorial
//
//  Created by james rochabrun on 7/2/17.
//  Copyright © 2017 james rochabrun. All rights reserved.
//

import Foundation
import UIKit

enum ButtonFactory {
    
    case buttonWithImage(image: UIImage, cornerRadius: CGFloat, target: Any, selector: (Selector), sizeToFit: Bool)
    
    var new: UIButton {
        switch self {
        case .buttonWithImage(let image,let cornerRadius,let target,let selector, let sizeToFit):
            return createButtonWithImage(image: image, cornerRadius: cornerRadius, target: target, selector: selector, sizeToFit: sizeToFit)
         }
    }
    
    private func createButtonWithImage(image: UIImage, cornerRadius: CGFloat, target: Any, selector: (Selector), sizeToFit: Bool) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        if sizeToFit {
            button.sizeToFit()
        }
        return button
        
    }
}



