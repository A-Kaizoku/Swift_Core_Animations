//
//  AnimationViewController.swift
//  UICoreAnimations
//
//  Created by Mayank Dubey on 23/12/24.
//

import UIKit

class AnimationViewController: UIViewController {
    
    private var rectView: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .orange
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        view.addSubview(rectView)
    }
    
    
    
}
