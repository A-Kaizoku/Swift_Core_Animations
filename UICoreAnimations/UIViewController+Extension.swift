//
//  UIViewController+Extension.swift
//  UICoreAnimations
//
//  Created by Mayank Dubey on 24/12/24.
//

import UIKit

extension UIViewController {
    static let swizzlePresentationStyle: Void = {
        let originalSelector = #selector(getter: UIViewController.modalPresentationStyle)
        let swizzledSelector = #selector(getter: swizzled_modalPresentationStyle)

        guard let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector),
              let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector) else {
            return
        }

        method_exchangeImplementations(originalMethod, swizzledMethod)
    }()

    @objc private var swizzled_modalPresentationStyle: UIModalPresentationStyle {
        return .fullScreen
    }
}
