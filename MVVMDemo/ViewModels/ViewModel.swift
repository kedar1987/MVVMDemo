//
//  ViewModel.swift
//  MVVMDemo
//
//  Created by Kedar Tukshetty on 17/09/21.
//

import Foundation

protocol ViewModelProtocol {
    func sendValue(emailValue:String?, passwordValue:String?)
}


class ViewModel : NSObject, ViewModelProtocol {
    
    weak var delegate: ViewControllerDelegate?

    
    func sendValue(emailValue:String?, passwordValue:String?)
    {
        guard let email = emailValue else {
            return
        }
        guard let password = passwordValue else {
            return
        }
        
      //  print("email ====== \(email)")
       // print("password ====== \(password)")

        delegate?.getInfoFromViewModel(handleMessage: "\(email)   ++++   \(password)")
    }
    
}
