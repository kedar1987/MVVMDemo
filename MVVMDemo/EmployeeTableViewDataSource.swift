//
//  EmployeeTableViewDataSource.swift
//  MVVMDemo
//
//  Created by Kedar Tukshetty on 18/09/21.
//

import Foundation
import UIKit

class EmployeeTableViewDataSource<cell : UITableViewCell,T> : NSObject, UITableViewDataSource {
   
    
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configCell : ((cell, T) -> Void) = {_,_ in }
    
    
    init(cellIdentifier:String, items:[T], configCell : @escaping (cell, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configCell = configCell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! cell
        
        let item = self.items[indexPath.row]
        self.configCell(cell,item)
        return cell
        
    }
    
}
