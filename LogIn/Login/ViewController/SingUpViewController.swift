//
//  ForgetPasswordViewController.swift
//  LogIn
//
//  Created by Enzo Boragina on 01/04/24.
//

import UIKit

class SingUpViewController: UIViewController {

    var isSelectCheckBox: Bool = false
    
    lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Estrela")
        return image
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .ds(.textfield)
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create your account✨"
        label.font = UIFont.dsFonts(.poppinsBold21)
        label.textColor = .ds(.fontWhite)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome! please enter your details."
        label.textColor = .ds(.fontGray)
        label.font = UIFont.dsFonts(.poppinsRegular16)
        return label
    }()
    
    lazy var nameTextfield: CustomTextField = {
        let tx = CustomTextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.titleLabel.text = "Name"
        tx.imageCard.image = UIImage(systemName: "person.fill")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.ds(.fontGray),]
        let attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: placeholderAttributes)
        tx.textField.attributedPlaceholder = attributedPlaceholder
        return tx
    }()
    
    lazy var emailTextfield: CustomTextField = {
        let tx = CustomTextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.titleLabel.text = "Email"
        tx.imageCard.image = UIImage(systemName: "envelope")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.ds(.fontGray),]
        let attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: placeholderAttributes)
        tx.textField.attributedPlaceholder = attributedPlaceholder
        return tx
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let tx = CustomTextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.titleLabel.text = "Password"
        tx.imageCard.image = UIImage(systemName: "lock")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.ds(.fontGray),]
        let attributedPlaceholder = NSAttributedString(string: "********", attributes: placeholderAttributes)
        tx.textField.attributedPlaceholder = attributedPlaceholder
        return tx
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .ds(.textfield)
        button.addTarget(self, action: #selector(showPasswordTapped(_ :)), for: .touchUpInside)
        return button
    }()
    
    @objc func showPasswordTapped(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        passwordTextField.textField.isSecureTextEntry = !sender.isSelected
    }
    
    lazy var charBox: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(tapedCheckBox), for: .touchUpInside)
        return button
    }()
    
    @objc func tapedCheckBox(){
        charBox.isSelected = !charBox.isSelected
        isSelectCheckBox = charBox.isSelected
        if charBox.isSelected {
            charBox.backgroundColor = .white
        } else {
            charBox.backgroundColor = .clear
        }
    }
    
    lazy var charLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Must be at least 8 characters"
        label.textColor = .ds(.fontGray)
        label.font = UIFont.dsFonts(.poppinsRegular10)
        return label
    }()
    
    lazy var singUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sing Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.dsFonts(.poppinsBold16)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.ds(.coralBtn).cgColor, UIColor.ds(.purpleBtn).cgColor] // Cores do degradê
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5) // Ponto de partida do degradê
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5) // Ponto final do degradê
        // Atribuir o frame após o layout do botão ser finalizado
        DispatchQueue.main.async {
            gradientLayer.frame = button.bounds
            button.layer.cornerRadius = button.bounds.height / 5
        }
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapVerify), for: .touchUpInside)
        return button
    }()
    
    @objc func tapVerify() {
        let vc = VerifyEmailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var singUpWihtGoogle: CustomView = {
        let lg = CustomView()
        lg.translatesAutoresizingMaskIntoConstraints = false
        lg.logoImage.image = UIImage(named: "LogoGoogle")
        lg.loginWithLabel.text = "Sing Up with Google"
        return lg
    }()
    
    lazy var singUpWihtFace: CustomViewFacebook = {
        let lf = CustomViewFacebook()
        lf.translatesAutoresizingMaskIntoConstraints = false
        lf.logoImage.image = UIImage(named: "LogoFace")
        lf.loginWithLabel.text = "Sing Up with Facebook"
        return lf
    }()
    
    lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Already have an account? "
        label.textColor = .ds(.textfield)
        label.font = UIFont.dsFonts(.poppinsRegular16)
        return label
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.dsFonts(.poppinsBold14)
        button.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
        return button
    }()

    @objc func tapLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        passwordTextField.textField.isSecureTextEntry = true
    }
    
}

extension SingUpViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(starImage)
        view.addSubview(lineView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(nameTextfield)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(charBox)
        view.addSubview(charLabel)
        view.addSubview(singUpButton)
        view.addSubview(singUpWihtGoogle)
        view.addSubview(singUpWihtFace)
        view.addSubview(logInLabel)
        view.addSubview(logInButton)
    }
    
    func setupConstraints() {
        starImage.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            topConstant: 60,
            leftConstant: 10,
            widthConstant: 50,
            heightConstant: 50
        )
        
        lineView.anchor(
            left: starImage.rightAnchor,
            right: view.rightAnchor,
            centerY: starImage.centerYAnchor,
            leftConstant: 30,
            rightConstant: 20,
            heightConstant: 1
        )
        
        titleLabel.anchor(
            top: starImage.bottomAnchor,
            left: view.leftAnchor,
            topConstant: 10,
            leftConstant: 20
        )
        
        subtitleLabel.anchor(
            top: titleLabel.bottomAnchor,
            left: view.leftAnchor,
            topConstant: 8,
            leftConstant: 20
        )
        
        nameTextfield.anchor(
            top: subtitleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 40,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 50
        )
        
        emailTextfield.anchor(
            top: nameTextfield.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 40,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 50
        )
        
        passwordTextField.anchor(
            top: emailTextfield.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 40,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 50
        )
        
        showPasswordButton.anchor(
            bottom: passwordTextField.bottomAnchor,
            right: passwordTextField.rightAnchor,
            bottomConstant: 10,
            rightConstant: 10,
            widthConstant: 25,
            heightConstant: 30
        )
        
        charBox.anchor(
            top: passwordTextField.bottomAnchor,
            left: view.leftAnchor,
            topConstant: 15,
            leftConstant: 20,
            widthConstant: 20,
            heightConstant: 20
        )
        
        charLabel.anchor(
            top: passwordTextField.bottomAnchor,
            left: charBox.rightAnchor,
            centerY: charBox.centerYAnchor,
            leftConstant: 15
        )
        
        singUpButton.anchor(
            top: charBox.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 20,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 50
        )
        
        singUpWihtGoogle.anchor(
            top: singUpButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 10,
            leftConstant: 10,
            rightConstant: 10,
            heightConstant: 50
        )
        
        singUpWihtFace.anchor(
            top: singUpWihtGoogle.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 10,
            leftConstant: 10,
            rightConstant: 10,
            heightConstant: 50
        )
        
        logInLabel.anchor(
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            leftConstant: 65,
            bottomConstant: 40
        )
        
        logInButton.anchor(
            left: logInLabel.rightAnchor,
            centerY: logInLabel.centerYAnchor,
            leftConstant: 10
        )

    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .ds(.background)
    }
}
