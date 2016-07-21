//
//  Animator.swift
//  CustomTransitions
//
//  Created by zhangjing on 16/7/12.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {

    var operation = UINavigationControllerOperation.Push
    let duration = 0.5
    var originFrame = CGRect.zero
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let imageView = operation == .Push ? toView : transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        let containerView = transitionContext.containerView()!
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(imageView)
        
        let initialFrame = operation == .Push ? originFrame : imageView.frame
        let finalFrame = operation == .Push ? imageView.frame : originFrame
        
        
        
        let xScale = operation == .Push ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScale = operation == .Push ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        if operation == .Push {
            imageView.transform = CGAffineTransformMakeScale(xScale, yScale)
            imageView.center = CGPoint(x: CGRectGetMidX(initialFrame), y: CGRectGetMidY(initialFrame))
            imageView.clipsToBounds = true
        }
        
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { 
            imageView.transform = self.operation == .Push ? CGAffineTransformIdentity : CGAffineTransformMakeScale(xScale, yScale)
            imageView.center = CGPoint(x: CGRectGetMidX(finalFrame), y: CGRectGetMidY(finalFrame))
            }) { (_) in
                transitionContext.completeTransition(true)
        }        
    }
}
