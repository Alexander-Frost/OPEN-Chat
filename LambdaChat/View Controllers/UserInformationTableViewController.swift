//
//  UserInformationTableViewController.swift
//  LambdaChat
//
//  Created by Alex on 1/23/20.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import Firebase

class UserInformationTableViewController: UITableViewController {

    // MARK: - Instance Variables
    
    var userPhoneNumber : String?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Check if we have the users phone number from log in, if we do, we fetch their information from firebase
        if userPhoneNumber != nil {
            pullUserInformation(fromNumber: userPhoneNumber!)
        }
    }
    
    // MARK: - Network functions
    
    //Fetch user name and from number from firebase 
    private func pullUserInformation(fromNumber : String) {
        FirebaseDatabase.UserDatabaseReference.child(fromNumber).observeSingleEvent(of: .value) {[weak self] (data) in
            
            guard let dataDictionary = data.value as? [String : Any] else {return}
            
            if let userName = dataDictionary[UserKeys.UserNameKey] as? String {
                DispatchQueue.main.async {
                    self?.nameLabel.text = userName
                }
            }
            
            if let phoneNumber = dataDictionary[UserKeys.UserPhoneNumberKey] as? String {
                DispatchQueue.main.async {
                    self?.phoneNumberLabel.text = phoneNumber
                }
            }
        }
    }
}
