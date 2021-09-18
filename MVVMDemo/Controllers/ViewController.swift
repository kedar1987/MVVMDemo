//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Kedar Tukshetty on 17/09/21.
//

import UIKit

protocol ViewControllerDelegate : AnyObject {
    func getInfoFromViewModel(handleMessage:String)
}

class ViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextfField: UITextField!
    var viewModel = ViewModel()
    var employeesViewModel : EmployeesViewModel!
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesViewModel = EmployeesViewModel()
       // employeesViewModel.getEmployeeData()
        employeeTableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "EmployeeTableViewCell")
        employeesViewModel.bindEmployeesViewModelToController = { [weak self] in
            guard let self = self else { return  }
            self.updateUI()
        }
        // Do any additional setup after loading the view.
    }

    func updateUI() {
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeesViewModel.empData.data, configCell: { (cell, evm) in
            cell.textLabel?.text = evm.employeeName //"\(evm.id)"
            cell.detailTextLabel?.text = evm.employeeName
            print("employeeName \(evm.employeeName)")
        })
        
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
    
        }
        
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        
        viewModel.delegate = self;
        viewModel.sendValue(emailValue: emailTextfField.text, passwordValue: passwordTextField.text)
    }
    
}

extension ViewController : ViewControllerDelegate {
    func getInfoFromViewModel(handleMessage:String) {
        
        print("getInfoFromViewModel \(handleMessage)")
        
    }
}
