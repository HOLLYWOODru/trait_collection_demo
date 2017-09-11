//
//  ViewController.swift
//  Swift Trait Collection Demo
//
//  Created by Aleksey Rodionov on 08.08.17.
//  Copyright © 2017 HOLLYWOOD Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rootStackView: UIStackView!
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var myButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var rootStackViewCenterX: NSLayoutConstraint!
    @IBOutlet weak var rootStackViewCenterY: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTraitCollection()
    }
    
    func sizeClassText(sizeClass: UIUserInterfaceSizeClass) -> String {
        switch sizeClass {
        case .compact:
            return "Compact"
        case .regular:
            return "Regular"
        default:
            return "Unspecified"
        }
    }

    func deviceText(deviceType: UIUserInterfaceIdiom) -> String {
        switch deviceType {
        case .phone:
            return "iPhone"
        case .pad:
            return "iPad"
        case .tv:
            return "Apple TV"
        default:
            return "Unspecified"
        }
    }
    
    func displayTraitCollection() {
        deviceLabel.text = "Device: " + deviceText(deviceType: traitCollection.userInterfaceIdiom)
        heightLabel.text = "Height: " + sizeClassText(sizeClass: traitCollection.verticalSizeClass)
        widthLabel.text = "Width: " + sizeClassText(sizeClass: traitCollection.horizontalSizeClass)
    
        if traitCollection.horizontalSizeClass == .regular {
            rootStackView.axis = .horizontal
            myButtonWidth.constant = 100
            rootStackViewCenterX.constant = -150
            rootStackViewCenterY.constant = 0
        } else {
            rootStackView.axis = .vertical
            myButtonWidth.constant = 0
            rootStackViewCenterX.constant = 0
            rootStackViewCenterY.constant = 200
        }
        
        updateViewConstraints()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        displayTraitCollection()
    }
}

