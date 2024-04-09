//
//  CustomTextField.swift
//  LogIn
//
//  Created by Enzo Boragina on 26/03/24.
//
import UIKit

class CustomTextField: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dsFonts(.poppinsRegular12)
        label.textColor = .white
        return label
    }()
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.ds(.textfield).cgColor
        view.layer.cornerRadius = 6
        return view
    }()
    
    lazy var imageCard: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .ds(.fontGray)
        return image
    }()
    
    lazy var textField: UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomTextField: ViewCodeType{
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(borderView)
        borderView.addSubview(imageCard)
        borderView.addSubview(textField)
    }
    
    func setupConstraints() {
        titleLabel.anchor(
            left: leftAnchor,
            bottom: bottomAnchor,
            bottomConstant: 55
        )
        
        borderView.anchor(
            top: titleLabel.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            topConstant: 6,
            heightConstant: 50
        )
        
        imageCard.anchor(
            top: borderView.bottomAnchor,
            left: borderView.leftAnchor,
            centerY: borderView.centerYAnchor,
            topConstant: 8,
            leftConstant: 10,
            widthConstant: 25,
            heightConstant: 25
        )
        
        textField.anchor(
            top: borderView.bottomAnchor,
            left: imageCard.leftAnchor,
            centerY: borderView.centerYAnchor,
            topConstant: 8,
            leftConstant: 35,
            heightConstant: 40
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .ds(.darkGray)
        layer.cornerRadius = 6
    }
}
