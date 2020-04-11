//
//  TransactionController.swift
//  KVO-Lab
//
//  Created by Kelby Mittan on 4/11/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class TransactionController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    
    @IBOutlet var transactionTextField: UITextField!
    
    private let account: BankAccount
        
    init?(coder: NSCoder, account: BankAccount) {
        self.account = account
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    private func updateUI() {
        nameLabel.text = account.username
        balanceLabel.text = "$\(account.balance.description)"
    }
    
    @IBAction func withdrawalButtonPressed(_ sender: UIButton) {
        
        guard let balanceText = transactionTextField.text, !balanceText.isEmpty, let amount = Double(balanceText) else {
            showAlert(title: "Please enter an amount", message: "")
            return
        }
        
        account.balance -= amount
        balanceLabel.text = "$\(account.balance.description)"
    }
    
    
    @IBAction func depositButtonPressed(_ sender: UIButton) {
        
        guard let balanceText = transactionTextField.text, !balanceText.isEmpty, let amount = Double(balanceText) else {
            showAlert(title: "Please enter an amount", message: "")
            return
        }
        account.balance += amount
        balanceLabel.text = "$\(account.balance.description)"
    }
    
}
