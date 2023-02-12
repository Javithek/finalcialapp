//
//  UIColor.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 10/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var borderUIColor : UIColor {
        get{
            guard let color = layer.borderColor else{
                return UIColor.black
            }
            return UIColor(cgColor : color)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
    
}
