//
//  Swipeable.swift
//  TinderLikeTutorial
//
//  Created by james rochabrun on 7/3/17.
//  Copyright © 2017 james rochabrun. All rights reserved.
//

import Foundation
import UIKit

//MARK: 1 protocol
protocol Swipeable { }

//MARK: 2 Protocol extension constrained to UIPanGestureRecognizer
extension Swipeable where Self: UIPanGestureRecognizer {
    
    //MARK 3 Main function
    func swipeView(_ view: UIView) {
        
        switch state {
        case .changed:
            let translation = self.translation(in: view.superview)
            view.transform = transform(view: view, for: translation)
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                view.transform = .identity
            }, completion: nil)
            
        default:
            break
        }
    }
    
    //MARK: 4 Helper method that handles transformation
    private func transform(view: UIView, for translation: CGPoint) -> CGAffineTransform {
        
        let moveBy = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = -sin(translation.x / (view.frame.width * 4.0))
        return moveBy.rotated(by: rotation)
    }    
}



//MARK: 5 UIPanGestureRecognizer conforming to Swipeable
extension UIPanGestureRecognizer: Swipeable {}



