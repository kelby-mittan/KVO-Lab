//
//  BankAccountsController.swift
//  KVO-Lab
//
//  Created by Kelby Mittan on 4/11/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class BankAccountsController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var bankAccounts = [BankAccount]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var bankAccountsObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        loadAccounts()
        
        configureBankAccountsObservation()
        print(Accounts.shared.bankAccounts.first?.balance.description ?? 0)
    }
 
    private func loadAccounts() {
        bankAccounts = Accounts.shared.bankAccounts
    }
    
    private func configureBankAccountsObservation() {
        
        bankAccountsObservation = Accounts.shared.observe(\.bankAccounts, options: [.new, .old], changeHandler: { [weak self] (account, change) in
            guard let bankAccounts = change.newValue else { return }
            self?.bankAccounts = bankAccounts
        })
        
    }
    
}

extension BankAccountsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bankAccountCell", for: indexPath)
        
        
        let account = bankAccounts[indexPath.row]
        cell.textLabel?.text = account.username
        cell.detailTextLabel?.text = "$ \(account.balance.description)"
        return cell
    }
    
}

extension BankAccountsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let account = bankAccounts[indexPath.row]
        
//        let transactionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TransactionController") as! TransactionController
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let transactionVC = sb.instantiateViewController(identifier: "TransactionController", creator: { coder in
            
            return TransactionController(coder: coder, account: account)
        })
        
        
        navigationController?.pushViewController(transactionVC, animated: true)
    }
}


//let createStoryboard = UIStoryboard(name: "CreateCollection", bundle: nil)
//
//let createCollectionVC = createStoryboard.instantiateViewController(identifier: "CreateCollectionController", creator: { coder in
//
//    return CreateCollectionController(coder: coder, venuePersistence: self.venuePersistence, collectionPersistence: self.collectionPersistence)
//})
