//
//  ListRegisterViewController.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 12/07/23.
//

import UIKit

class ListRegisterViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureContraints()
    }
    
    private func configureViews() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RegisterCell.self, forCellReuseIdentifier: RegisterCell.identifier)
        view.addSubview(tableView)
    }
    
    private func configureContraints() {
        var constraints = [NSLayoutConstraint]()

        // tableView
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        NSLayoutConstraint.activate(constraints)
    }
}

extension ListRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.identifier, for: indexPath) as? RegisterCell
    
        return cell ?? UITableViewCell()
    }
    
    
}
