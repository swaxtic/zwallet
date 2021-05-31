//
//  UIViewExtension.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public extension UIView{
    @IBInspectable // agar corner radius tampil dalam property di kanan xcode
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var topCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            //clipsToBounds = true
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    func dropShadowEffect() {
        self.layer.shadowOpacity = 0.35
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
    }
}
