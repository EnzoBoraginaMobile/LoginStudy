//
//  LoginViewController.swift
//  LogIn
//
//  Created by Enzo Boragina on 26/03/24.
//

import UIKit

class LoginViewController: UIViewController {

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
        label.text = "Log in to your account ✨"
        label.textColor = .ds(.fontWhite)
        label.font = UIFont.dsFonts(.poppinsBold21)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome back! please enter your details."
        label.textColor = .ds(.fontGray)
        label.font = UIFont.dsFonts(.poppinsRegular16)
        return label
    }()
    
    lazy var emailTextfield: CustomTextField = {
        let tx = CustomTextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.titleLabel.text = "Email"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.ds(.fontGray),]
        let attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: placeholderAttributes)
        tx.textField.attributedPlaceholder = attributedPlaceholder
        tx.imageCard.image = UIImage(systemName: "envelope")
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
    
    lazy var remembermeBox: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(tapedCheckBox), for: .touchUpInside)
        return button
    }()
    
    @objc func tapedCheckBox(){
        remembermeBox.isSelected = !remembermeBox.isSelected
        isSelectCheckBox = remembermeBox.isSelected
        if remembermeBox.isSelected {
            remembermeBox.backgroundColor = .white
        } else {
            remembermeBox.backgroundColor = .clear
        }
    }
    
    lazy var remembermeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remember for 30 days"
        label.textColor = .ds(.fontGray)
        label.font = UIFont.dsFonts(.poppinsRegular10)
        return label
    }()
    
    lazy var forgotPassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.dsFonts(.poppinsBold10)
//        button.addTarget(self, action: #selector(tapRecovery), for: .touchUpInside)
        return button
    }()
    
//    @objc func tapRecovery() {
//        let vc = SingUpViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
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
        
        return button
    }()
    
    lazy var loginWihtGoogle: CustomView = {
        let lg = CustomView()
        lg.translatesAutoresizingMaskIntoConstraints = false
        lg.logoImage.image = UIImage(named: "LogoGoogle")
        lg.loginWithLabel.text = "Log in with Google"
        return lg
    }()
    
    lazy var loginWihtFace: CustomViewFacebook = {
        let lf = CustomViewFacebook()
        lf.translatesAutoresizingMaskIntoConstraints = false
        lf.logoImage.image = UIImage(named: "LogoFace")
        lf.loginWithLabel.text = "Log in with Facebook"
        return lf
    }()
    
    lazy var singUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an accoint? "
        label.textColor = .ds(.textfield)
        label.font = UIFont.dsFonts(.poppinsRegular16)
        return label
    }()
    
    lazy var singUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sing Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.dsFonts(.poppinsBold14)
        button.addTarget(self, action: #selector(tapSingup), for: .touchUpInside)
        return button
    }()
    
    @objc func tapSingup() {
        let vc = SingUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        passwordTextField.textField.isSecureTextEntry = true
    }
}

extension LoginViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(starImage)
        view.addSubview(lineView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(remembermeBox)
        view.addSubview(remembermeLabel)
        view.addSubview(forgotPassButton)
        view.addSubview(loginButton)
        view.addSubview(loginWihtGoogle)
        view.addSubview(loginWihtFace)
        view.addSubview(singUpLabel)
        view.addSubview(singUpButton)
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
        
        emailTextfield.anchor(
            top: subtitleLabel.bottomAnchor,
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
        
        remembermeBox.anchor(
            top: passwordTextField.bottomAnchor,
            left: view.leftAnchor,
            topConstant: 15,
            leftConstant: 20,
            widthConstant: 20,
            heightConstant: 20
        )
        
        remembermeLabel.anchor(
            top: passwordTextField.bottomAnchor,
            left: remembermeBox.leftAnchor,
            centerY: remembermeBox.centerYAnchor,
            leftConstant: 25
        )
        
        forgotPassButton.anchor(
            top: passwordTextField.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 10,
            rightConstant: 20
        )
        
        loginButton.anchor(
            top: forgotPassButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 25,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 50
        )
        
        loginWihtGoogle.anchor(
            top: loginButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 10,
            leftConstant: 10,
            rightConstant: 10,
            heightConstant: 50
        )
        
        loginWihtFace.anchor(
            top: loginWihtGoogle.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 10,
            leftConstant: 10,
            rightConstant: 10,
            heightConstant: 50
        )
        
        singUpLabel.anchor(
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            leftConstant: 70,
            bottomConstant: 30
        )
        
        singUpButton.anchor(
            left: singUpLabel.rightAnchor,
            bottom: view.bottomAnchor,
            centerY: singUpLabel.centerYAnchor,
            leftConstant: 10,
            bottomConstant: 30
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .ds(.background)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
