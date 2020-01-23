//
//  UINavigationController+Extensions.swift
//  LambdaChat
//
//  Created by Alex on 1/23/20.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func currentviewController() -> UIViewController {
        if visibleViewController != nil {
            return visibleViewController!
        } else {
            return self
        }
    }
}
