//
//  RegisterCell.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 12/07/23.
//

import UIKit

class RegisterCell: UITableViewCell {
    
    static let identifier = "RegisterCell"
//    static func nib() -> UINib {
//        return UINib(nibName: self.identifier, bundle: nil)
//    }
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .blue

        return containerView
    }()

    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Jhonata"
        
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConstraints()
        self.contentView.addSubview(nameLabel)
//        self.contentView.addSubview(containerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        configureConstraints()
////        self.contentView.addSubview(containerView)
//        self.contentView.addSubview(nameLabel)
//    }
    
    private func configureConstraints() {
        var constraints = [NSLayoutConstraint]()

        // tableView
//        constraints.append(containerView.leadingAnchor.constraint(equalTo:  self.contentView.layoutMarginsGuide.leadingAnchor))
//        constraints.append(containerView.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor))
//        constraints.append(containerView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor))
//        constraints.append(containerView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor))
        
        constraints.append(nameLabel.centerXAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerXAnchor))
        constraints.append(nameLabel.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor))

        NSLayoutConstraint.activate(constraints)
    }
    
}
