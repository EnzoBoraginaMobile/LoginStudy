//
//  VerifyEmailViewController.swift
//  LogIn
//
//  Created by Enzo Boragina on 04/04/24.
//

import UIKit

class VerifyEmailViewController: UIViewController, UITextFieldDelegate {

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
        label.text = "Check your email✨"
        label.font = UIFont.dsFonts(.poppinsBold21)
        label.textColor = .ds(.fontWhite)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We send a verification code to email@email.com."
        label.textColor = .ds(.fontGray)
        label.font = UIFont.dsFonts(.poppinsRegular14)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pinTextField1, pinTextField2, pinTextField3, pinTextField4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var pinTextField1: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.ds(.coralBtn).cgColor
        textField.backgroundColor = .ds(.textfield)
        textField.tag = 1
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var pinTextField2: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.ds(.coralBtn).cgColor
        textField.backgroundColor = .ds(.textfield)
        textField.tag = 2
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var pinTextField3: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.ds(.coralBtn).cgColor
        textField.backgroundColor = .ds(.textfield)
        textField.tag = 3
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var pinTextField4: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.ds(.coralBtn).cgColor
        textField.backgroundColor = .ds(.textfield)
        textField.tag = 4
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var verifyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Verify Email", for: .normal)
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
        button.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func tapLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var resendEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Didn`t recive the email?"
        label.textColor = .ds(.textfield)
        label.font = UIFont.dsFonts(.poppinsRegular16)
        return label
    }()
    
    lazy var resendEmailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click to resend", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.dsFonts(.poppinsBold14)
        button.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var backToLogInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("← Back to Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.dsFonts(.poppinsBold14)
        button.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupTextFieldActions(){
        pinTextField1.addTarget(self, action: #selector(didTap), for: .editingChanged)
        pinTextField2.addTarget(self, action: #selector(didTap), for: .editingChanged)
        pinTextField3.addTarget(self, action: #selector(didTap), for: .editingChanged)
        pinTextField4.addTarget(self, action: #selector(didTap), for: .editingChanged)
    }
    
    @objc func didTap(_ textField: UITextField){
        let tag = textField.tag
        
        if let text = textField.text, !text.isEmpty {
            // Se o usuário digitou um número, vá para o próximo campo ou conclua se for o último.
            if tag < 4 {
                let nextTag = tag + 1
                if let nextTextField = view.viewWithTag(nextTag) as? UITextField {
                    nextTextField.becomeFirstResponder()
                } else {
                    textField.resignFirstResponder()
                    // Aqui você pode verificar o PIN inserido pelos usuários.
                    // Compare o valor atual dos quatro campos de texto.
                }
            }
        } else {
            // Se o campo de texto está vazio (apagado), vá para o campo anterior.
            if tag > 1 {
                let previousTag = tag - 1
                if let previousTextField = view.viewWithTag(previousTag) as? UITextField {
                    previousTextField.becomeFirstResponder()
                }
            }
        }
    }
}

extension VerifyEmailViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(starImage)
        view.addSubview(lineView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(stackView)
        view.addSubview(verifyButton)
        view.addSubview(resendEmailLabel)
        view.addSubview(resendEmailButton)
        view.addSubview(backToLogInButton)
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
        
        stackView.anchor(
            top: subtitleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 30,
            leftConstant: 60,
            rightConstant: 60,
            heightConstant: 50
        )
        
        verifyButton.anchor(
            top: stackView.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: 30,
            leftConstant: 20,
            rightConstant: 20,
            heightConstant: 50
        )
        
        resendEmailLabel.anchor(
            top: verifyButton.bottomAnchor,
            left: view.leftAnchor,
            topConstant: 50,
            leftConstant: 50
        )
        
        resendEmailButton.anchor(
            top: verifyButton.bottomAnchor,
            left: resendEmailLabel.rightAnchor,
            centerY: resendEmailLabel.centerYAnchor,
            leftConstant: 5
        )
        
        backToLogInButton.anchor(
            bottom: view.bottomAnchor,
            centerX: view.centerXAnchor,
            bottomConstant: 40
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .ds(.background)
        setupTextFieldActions()
    }
}
