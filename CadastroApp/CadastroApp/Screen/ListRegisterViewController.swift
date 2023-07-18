//
//  ListRegisterViewController.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 12/07/23.
//

enum LoadingRegistersError: Error {
    case failedToLoading
}

import UIKit

class ListRegisterViewController: UIViewController {
    
    private var registersList: [UserModel]? = []
    private var services = Services()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private let addButton: UIButton = {
        let addButton = UIButton(type: .system)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        addButton.backgroundColor = .purple
        addButton.layer.cornerRadius = 25
       
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        services.storageClear()
        loadingRegisters()
        configureViews()
        configureContraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadingRegisters()
        tableView.reloadData()
    }
    
    private func loadingRegisters() {
        do {
            
            registersList = try self.services.getAllRegisters()
            
            print(">>>> user: \(registersList)")
        } catch {
           print(">>>> loadingRegisters.error")
        }
    }
    
    private func configureViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RegisterCell.self, forCellReuseIdentifier: RegisterCell.identifier)
        
        addButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        view.addSubview(tableView)
        view.addSubview(addButton)
    }
    
    @objc func navigate(sender: UIButton!) {
        let nextScreen = RegisterViewController(sevices: self.services)
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    private func configureContraints() {
        var constraints = [NSLayoutConstraint]()

        // tableView
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        // addButton
        constraints.append(addButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(addButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        constraints.append(addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60))

        NSLayoutConstraint.activate(constraints)
    }
}

extension ListRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        registersList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.identifier, for: indexPath) as? RegisterCell
        
        cell?.setupCell(registersList![indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
}
