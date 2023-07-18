//
//  RegisterCell.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 12/07/23.
//

import UIKit

class RegisterCell: UITableViewCell {
    
    static let identifier = "RegisterCell"
        
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Nome:"
        nameLabel.textColor = .darkGray
        
        let boldFont = UIFont.boldSystemFont(ofSize: nameLabel.font.pointSize)
        let boldFontDescriptor = nameLabel.font.fontDescriptor.withSymbolicTraits(.traitBold)
        nameLabel.font = UIFont(descriptor: boldFontDescriptor!, size: nameLabel.font.pointSize)
        
        return nameLabel
    }()
    
    private let nameValue: UILabel = {
        let nameValue = UILabel()
       
        nameValue.translatesAutoresizingMaskIntoConstraints = false
        
        let boldFont = UIFont.boldSystemFont(ofSize: nameValue.font.pointSize)
        let boldFontDescriptor = nameValue.font.fontDescriptor.withSymbolicTraits(.traitBold)
        nameValue.font = UIFont(descriptor: boldFontDescriptor!, size: nameValue.font.pointSize)
        
        return nameValue
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email:"
        emailLabel.textColor = .darkGray
        
        let boldFont = UIFont.boldSystemFont(ofSize: emailLabel.font.pointSize)
        let boldFontDescriptor = emailLabel.font.fontDescriptor.withSymbolicTraits(.traitBold)
        emailLabel.font = UIFont(descriptor: boldFontDescriptor!, size: emailLabel.font.pointSize)
        
        return emailLabel
    }()
    
    private let emailValue: UILabel = {
        let emailValue = UILabel()
       
        emailValue.translatesAutoresizingMaskIntoConstraints = false
        
        let boldFont = UIFont.boldSystemFont(ofSize: emailValue.font.pointSize)
        let boldFontDescriptor = emailValue.font.fontDescriptor.withSymbolicTraits(.traitBold)
        emailValue.font = UIFont(descriptor: boldFontDescriptor!, size: emailValue.font.pointSize)
        
        return emailValue
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureComponents()
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ data: UserModel) {
        nameValue.text = data.name
        emailValue.text = data.email
    }
    
    private func configureComponents() {
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(nameValue)
        self.contentView.addSubview(emailValue)
    }
        
    private func configureConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        //namelLabel
        constraints.append(nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15))
        constraints.append(nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20))
        
        //namelValue
        constraints.append(nameValue.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15))
        constraints.append(nameValue.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 60))
        
        //emailLabel
        constraints.append(emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10))
        constraints.append(emailLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20))
        
        //emailValue
        constraints.append(emailValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10))
        constraints.append(emailValue.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor, constant: 60))

        NSLayoutConstraint.activate(constraints)
    }
    
}
