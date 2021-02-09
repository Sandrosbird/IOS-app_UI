//
//  MyFriendsController.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 05.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//
import Foundation
import UIKit


class MyFriendsController: UITableViewController {
    
    var friends = FriendsFactory.mergeFriends()
    lazy var friendsInAlphabetOrder = FriendsFactory.inAlphabetOrder(users: friends)
    var filteredFriends = [User]() {
        didSet {
            tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsInAlphabetOrder[section].1.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let friendController = segue.destination as? UserImgController {
            if let indexPath = tableView.indexPathForSelectedRow {
                friendController.friendsForGettingPhoto = friends[indexPath.row]
            }
        }
    }
    

    
    private func sectionsNames () -> [String] {
        var characters = Set<String>()
        //дикая конструкция, скорее всего нифига не KISS
        for var friend in friends {
            characters.insert(String(friend.name.remove(at: friend.name.startIndex)))
        }
        return Array(characters)
    }
    
    lazy var namesForSections = sectionsNames().sorted()

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
               
        return filteredFriends.isEmpty ? friendsInAlphabetOrder.count : filteredFriends.count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return filteredFriends.isEmpty ? namesForSections : nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendCell
        var friend = friendsInAlphabetOrder[indexPath.section].1[indexPath.row]
        
        if filteredFriends.isEmpty {
            cell.selectionStyle = .none
            cell.friendName.text = friend.name
            cell.friendIcon.image = friend.avatar
        } else {
            friend = filteredFriends[indexPath.section]
            cell.selectionStyle = .none
            cell.friendName.text = friend.name
            cell.friendIcon.image = friend.avatar
        }
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var firstWordsArray = namesForSections//вопрос для видеоразбора: это нужно или нет? если все сделать в переменной headerTitle выдаст ошибку Cannot use mutating member on immutable value: function call returns immutable value
        let headerTitle = firstWordsArray.remove(at: section)
        return filteredFriends.isEmpty ? headerTitle : nil
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}


extension MyFriendsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchingText =  searchBar.text, !searchingText.isEmpty else {
            endSearch(searchBar)
            return
        }
        filteredFriends = friends.filter { $0.name.lowercased().contains(searchingText.lowercased()) }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        endSearch(searchBar)
        
    }
    
    private func endSearch (_ searchbar: UISearchBar) {
        searchbar.text = nil
        view.endEditing(true)
        filteredFriends = [User]()
    }
}
