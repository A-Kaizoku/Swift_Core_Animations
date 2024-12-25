//
//  AnimationViewController.swift
//  UICoreAnimations
//
//  Created by Mayank Dubey on 23/12/24.
//

import UIKit

class AnimationViewController: UIViewController {
    
    //two views
    // redView and rectView (using AutoLayout)
    let redView = UIView(frame: CGRect(x: 0, y: 300, width: 140, height: 100))
    
    private var rectView: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .orange
        return view
    }()
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title // Set the navigation bar title or title property
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .yellow
        redView.backgroundColor = .red
        view.addSubview(rectView)
        view.addSubview(redView)
        rectView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            rectView.widthAnchor.constraint(equalToConstant: 140),
            rectView.heightAnchor.constraint(equalToConstant: 100),
            rectView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            rectView.centerYAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            ])
        
        configureView(for: self.title!)
        
    }
    
    func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureView(for title: String) {
        guard let animationType = CellTitles(rawValue: title) else { return }
        switch animationType {
        case .Move:
            moveRectViewWithAnimation()
            moveAnimation()
        default:
            break
        }
    }
    
    
    func moveAnimation() {
        let animation: CABasicAnimation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 140
        animation.toValue = 300
        animation.duration = 1
        redView.layer.add(animation, forKey: "basic")
        redView.layer.position = CGPoint(x: 300, y: 100 + 100/2)
       
    }
    
    func moveRectViewWithAnimation() {
//        rectView.translatesAutoresizingMaskIntoConstraints = true
        
        // rectView.layer.position is not working cuz its using AUTO layout which overwrites any constraint chnages with the defined ones so even though the object will animate, its position will remain the same after the animation ends!
        let animation: CABasicAnimation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 140
        animation.toValue = 300
        animation.duration = 1
        rectView.layer.add(animation, forKey: "basic")
        rectView.layer.position = CGPoint(x: 300, y: 100 + 100/2)
    }
}
