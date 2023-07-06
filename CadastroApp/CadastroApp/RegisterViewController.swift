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
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(30)
        return titleLabel
    }()

    let nameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Digite seu nome"
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(20)
        return titleLabel
    }()

    let emailLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Digite seu email"
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(20)
        return titleLabel
    }()

    let passwordLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Digite sua senha"
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(20)
        return titleLabel
    }()

    let nameTextField: UITextField = {
        let nameTextField = UITextField()

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .line
        nameTextField.placeholder = "Nome"

        return nameTextField
    }()

    let emailTextField: UITextField = {
        let emailTextField = UITextField()

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.borderStyle = .line
        emailTextField.placeholder = "Email"

        return emailTextField
    }()

    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .line
        passwordTextField.placeholder = "Senha"

        return passwordTextField
    }()

    let registerButton: UIButton = {
        let registerButton = UIButton()

        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Salvar", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = .purple

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
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
    
        registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
//        registerButton.isEnabled = false

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
        print(">>> Click")
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
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}
