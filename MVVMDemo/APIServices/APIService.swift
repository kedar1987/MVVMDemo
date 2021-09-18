//
//  APIService.swift
//  MVVMDemo
//
//  Created by Kedar Tukshetty on 18/09/21.
//

import Foundation

class APIService: NSObject {
    
    let url = URL(string:"http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completionHandler: @escaping (Employees) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            
            do {
                let empData = try! JSONDecoder().decode(Employees.self, from: data!)
                completionHandler(empData)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
    
        }.resume()
        
        
    }
    
}
