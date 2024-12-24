//
//  CollectionViewCell.swift
//  UICoreAnimations
//
//  Created by Mayank Dubey on 23/12/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"

    private let label: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .darkGray
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let leftPadding: CGFloat = 20
        let generalPadding: CGFloat = 10
        let adjustedBounds = contentView.bounds.insetBy(dx: leftPadding, dy: generalPadding) // Shrinks the bounds
//        insetBy shrinks the rectangle by reducing its size.
//        offsetBy moves the rectangle to a new position.

        label.frame = adjustedBounds
    }
    
    func configure(with text: String) {
        label.text = text
    }
    
}
