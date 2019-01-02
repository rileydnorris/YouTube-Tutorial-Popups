//
//  ViewController.swift
//  blurPopup-Pre
//
//  Created by Riley Norris on 1/1/19.
//  Copyright © 2019 Riley Norris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showAction(_ sender: Any) {
        animateScaleIn(desiredView: blurView)
        animateScaleIn(desiredView: popupView)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        animateScaleOut(desiredView: popupView)
        animateScaleOut(desiredView: blurView)
    }
    
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet var popupView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.bounds = self.view.bounds
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width*0.9, height: self.view.bounds.height*0.4)
        popupView.layer.cornerRadius = 5
    }
    
    /// Animates a view to scale in and display
    func animateScaleIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
//            desiredView.transform = CGAffineTransform.identity
        }
    }
    
    /// Animates a view to scale out remove from the display
    func animateScaleOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }
}

