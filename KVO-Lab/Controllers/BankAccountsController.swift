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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Accounts.shared.bankAccounts.first?.balance.description ?? 0)
    }
 
    private func loadAccounts() {
        bankAccounts = Accounts.shared.bankAccounts
    }
}
