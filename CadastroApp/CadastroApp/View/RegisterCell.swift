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
        nameLabel.text = "Jhonata"
        
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureComponents()
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureComponents() {
        self.contentView.addSubview(nameLabel)
    }
        
    private func configureConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))
        constraints.append(nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor))

        NSLayoutConstraint.activate(constraints)
    }
    
}
