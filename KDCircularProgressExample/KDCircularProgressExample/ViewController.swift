//
//  ViewController.swift
//  KDCircularProgressExample
//
//  Created by Kaan Dedeoglu on 2/12/15.
//  Copyright (c) 2015 Kaan Dedeoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var progress: KDCircularProgress!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        
        let thumbParameters = KDCircularProgressThumbViewParameters()
        thumbParameters.showThumbView = true
        thumbParameters.thumViewBackgroundColor = .greenColor()
        thumbParameters.size = CGSizeMake(40, 40)
        thumbParameters.borderColor = .whiteColor()
        thumbParameters.borderWidth = 2
        thumbParameters.digitLabelTextColor = .blackColor()
        thumbParameters.percentLabelTextColor = .blackColor()
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 250, height: 250), thumbParameters: thumbParameters)
        progress.startAngle = 130
        progress.progressThickness = 0.4
        progress.trackThickness = 0.4
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .NoGlow
        progress.glowAmount = 0.9
//        progress.setColors(UIColor.cyanColor() ,UIColor.whiteColor(), UIColor.magentaColor(), UIColor.whiteColor(), UIColor.orangeColor())
        progress.progressColors = [.cyanColor()]
        progress.trackColor = .whiteColor()
        progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        view.addSubview(progress)
        
    }
    
    @IBAction func sliderDidChangeValue(sender: UISlider) {
        progress.angle = Double(sender.value)
        
        if sender.value == 360 {
            progress.thumbDigitLabel.text = "100"
        } else {
            progress.thumbDigitLabel.text = "68"
        }
    }
    
    @IBAction func animateButtonTapped(sender: UIButton) {
        progress.animateFromAngle(0, toAngle: 360, duration: 5) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
}

