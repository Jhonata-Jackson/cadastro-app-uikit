//
//  ViewController.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 05/07/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white

        return containerView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Cadastrar"
        titleLabel.applyStyle(.title)
        
        let boldFont = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)
        let boldFontDescriptor = titleLabel.font.fontDescriptor.withSymbolicTraits(.traitBold)
        titleLabel.font = UIFont(descriptor: boldFontDescriptor!, size: titleLabel.font.pointSize)
        
        return titleLabel
    }()

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Digite seu nome"
        nameLabel.applyStyle(.subTitle)
        
        let boldFont = UIFont.boldSystemFont(ofSize: nameLabel.font.pointSize)
        let boldFontDescriptor = nameLabel.font.fontDescriptor.withSymbolicTraits(.traitBold)
        nameLabel.font = UIFont(descriptor: boldFontDescriptor!, size: nameLabel.font.pointSize)

        return nameLabel
    }()

    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Digite seu email"
        emailLabel.applyStyle(.subTitle)
        
        let boldFont = UIFont.boldSystemFont(ofSize: emailLabel.font.pointSize)
        let boldFontDescriptor = emailLabel.font.fontDescriptor.withSymbolicTraits(.traitBold)
        emailLabel.font = UIFont(descriptor: boldFontDescriptor!, size: emailLabel.font.pointSize)
        
        return emailLabel
    }()

    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Digite sua senha"
        passwordLabel.applyStyle(.subTitle)
        
        let boldFont = UIFont.boldSystemFont(ofSize: passwordLabel.font.pointSize)
        let boldFontDescriptor = passwordLabel.font.fontDescriptor.withSymbolicTraits(.traitBold)
        passwordLabel.font = UIFont(descriptor: boldFontDescriptor!, size: passwordLabel.font.pointSize)
        
        return passwordLabel
    }()

    let nameTextField: UITextField = {
        let nameTextField = UITextField()

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Nome"

        return nameTextField
    }()

    let emailTextField: UITextField = {
        let emailTextField = UITextField()

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"

        return emailTextField
    }()

    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Senha"

        return passwordTextField
    }()

    let registerButton: UIButton = {
        let registerButton = UIButton(type: .system)

        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Salvar", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        registerButton.backgroundColor = .purple
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true

        return registerButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureContraints()
    }

    func configureViews() {
        view.addSubview(containerView)
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        nameTextField.keyboardType = .default
        nameTextField.autocorrectionType = .no
        
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        nameTextField.autocorrectionType = .no
        
        passwordTextField.keyboardType = .default
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        
        registerButton.sendActions(for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        registerButton.isEnabled = false

        containerView.addSubview(titleLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(nameTextField)
        containerView.addSubview(emailLabel)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordLabel)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(registerButton)
    }
    
    @objc func tappedRegisterButton(sender: UIButton!){
        print(">>> name: \(nameTextField.text!)")
        print(">>> email: \(emailTextField.text!)")
        print(">>> password: \(passwordTextField.text!)")
    }
    
    func validateForm() {
        
        if(nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText) {
            registerButton.isEnabled = true
        }
    }

    func configureContraints() {
        var constraints = [NSLayoutConstraint]()

        // containerView
        constraints.append(containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor))

        // containerView
        constraints.append(titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20))
        constraints.append(titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))

        // nameLabel
        constraints.append(nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25))
        constraints.append(nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))

        // nameTextField
        constraints.append(nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15))
        constraints.append(nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))
        constraints.append(nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25))
        constraints.append(nameTextField.heightAnchor.constraint(equalToConstant: 35))

        // emailLabel
        constraints.append(emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25))
        constraints.append(emailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))

        // emailTextField
        constraints.append(emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15))
        constraints.append(emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))
        constraints.append(emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25))
        constraints.append(emailTextField.heightAnchor.constraint(equalToConstant: 35))

        // passwordLabel
        constraints.append(passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25))
        constraints.append(passwordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))

        // passwordTextField
        constraints.append(passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15))
        constraints.append(passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))
        constraints.append(passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25))
        constraints.append(passwordTextField.heightAnchor.constraint(equalToConstant: 35))

        // registerButton
        constraints.append(registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50))
        constraints.append(registerButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25))
        constraints.append(registerButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25))
        constraints.append(registerButton.heightAnchor.constraint(equalToConstant: 45))

        NSLayoutConstraint.activate(constraints)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.validateForm()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
