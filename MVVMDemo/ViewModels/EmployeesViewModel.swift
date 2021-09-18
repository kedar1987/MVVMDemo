//
//  EmployeesViewModel.swift
//  MVVMDemo
//
//  Created by Kedar Tukshetty on 18/09/21.
//

import Foundation

class EmployeesViewModel : NSObject {
    
    private var apiServices : APIService!
    private(set) var empData : Employees! {
        didSet {
            self.bindEmployeesViewModelToController()
        }
    }

    var bindEmployeesViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        print("init EmployeesViewModel")
        apiServices = APIService()
        getEmployeeData()
    }
    
    func getEmployeeData() {
        
        apiServices.apiToGetEmployeeData { (empData) in
            self.empData = empData
            print("empData \(empData)")
        }
    }
    
}
