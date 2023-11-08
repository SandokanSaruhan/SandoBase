//
//  SearchBar
//
//
//  Created by Saruhan Kole on 24.02.2020.
//  Copyright © 2020 Saruhan Kole. All rights reserved.
//

import Foundation
import UIKit

extension SixthViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate { //Define the Controller
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredArray.count
        }else{
            return tempArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var theSelected: String?

        if isSearching {
            theSelected = filteredArray[indexPath.row]
        }else{
            theSelected = tempArray[indexPath.row]
        }
        let cell = mainTable.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        cell.textLabel?.text = theSelected
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        var theSelected: String?
        
        if isSearching {
            theSelected = filteredArray[indexPath.row]
        }else{
            theSelected = tempArray[indexPath.row]
        }
        
        self.toOtherPage(data: theSelected!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if mainSearchBar.text == nil || mainSearchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            mainTable.reloadData()
        }else{
            isSearching = true
            filteredArray = tempArray.filter({$0.range(of: mainSearchBar.text!, options: .caseInsensitive) != nil })
            mainTable.reloadData()
        }
    }
    
    // Detail Passed Data

    func toOtherPage(data: String) {
        print("Detail Page")
        // Call Another View Controller
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SixteenthViewController") as! SixteenthViewController
        VC.passedString = data
        self.present(VC, animated: true, completion: nil)
    }

}
