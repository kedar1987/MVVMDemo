//
//  Employee.swift
//  MVVMDemo
//
//  Created by Kedar Tukshetty on 18/09/21.
//

import Foundation

// MARK: - Welcome
struct Employees: Codable {
    let status: String
    let data: [EmployeeData]
    let message: String
}

// MARK: - Datum
struct EmployeeData: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
