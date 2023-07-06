//
//  ViewController.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 05/07/23.
//

import UIKit

class RegisterVC: UIViewController {
    
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
        titleLabel.font.withSize(40)
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        configureContraints()
    }
    
    func configureViews() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
    }
    
    func configureContraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        constraints.append(titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor))
        constraints.append(titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor))
        
        
        NSLayoutConstraint.activate(constraints)
    }


}

