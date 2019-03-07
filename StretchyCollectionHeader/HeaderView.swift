//
//  HeaderView.swift
//  StretchyCollectionHeader
//
//  Created by Prudhvi Gadiraju on 3/6/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "headerPhoto"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "Woooooo!"
        l.textColor = .white
        l.font = UIFont(name: "Avenir-Heavy", size: 18)
        return l
    }()
    
    var animator: UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imageView)
        fillSuperView(image: imageView)
        
        // Blur
        setupVisualEffectBlur()
        
        addSubview(label)
        setLabelConstraints(l: label)
    }
    
    func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            //End State of Animation
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            self?.fillSuperView(image: visualEffectView)
        })
    }
    
    func setLabelConstraints(l: UILabel) {
        l.translatesAutoresizingMaskIntoConstraints = false
        l.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        l.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    }
    
    func fillSuperView(image: UIView) {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
