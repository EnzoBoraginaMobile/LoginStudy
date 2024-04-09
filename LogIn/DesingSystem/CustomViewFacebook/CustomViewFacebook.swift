//
//  CustomViewFacebook.swift
//  LogIn
//
//  Created by Enzo Boragina on 01/04/24.
//

import UIKit

class CustomViewFacebook: UIView {

    lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var loginWithLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.dsFonts(.poppinsBold14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}

extension CustomViewFacebook: ViewCodeType {
    func buildViewHierarchy() {
        addSubview(borderView)
        borderView.addSubview(logoImage)
        borderView.addSubview(loginWithLabel)
    }
    
    func setupConstraints() {
        borderView.anchor(
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            leftConstant: 10,
            rightConstant: 10,
            heightConstant: 50
        )
        
        logoImage.anchor(
            top: borderView.bottomAnchor,
            left: borderView.leftAnchor,
            centerY: borderView.centerYAnchor,
            topConstant: 8,
            leftConstant: 66,
            widthConstant: 30,
            heightConstant: 30
        )
        
        loginWithLabel.anchor(
            top: borderView.bottomAnchor,
            left: logoImage.leftAnchor,
            centerY: borderView.centerYAnchor,
            topConstant: 8,
            leftConstant: 66,
            heightConstant: 20
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
