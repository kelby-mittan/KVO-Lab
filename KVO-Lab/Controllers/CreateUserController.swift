//
//  CreateUserController.swift
//  KVO-Lab
//
//  Created by Kelby Mittan on 4/11/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class CreateUserController: UIViewController {
    
    
    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var balanceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
        guard let nameText = usernameTextField.text, !nameText.isEmpty, let balance = balanceTextField.text, !balance.isEmpty, let balanceDouble = Double(balance) else {
            showAlert(title: "Missing Fields", message: "Please enter a name and starting balance.")
            return
        }
        
        let bankAccount = BankAccount()
        bankAccount.username = nameText
        bankAccount.balance = balanceDouble
        Accounts.shared.bankAccounts.append(bankAccount)
        
        guard let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as? UITabBarController else {
            fatalError("could not downcast")
        }


        tabBarController.selectedIndex = 1
        tabBarController.modalPresentationStyle = .overFullScreen
        present(tabBarController, animated: false)
        
    }
    
}
