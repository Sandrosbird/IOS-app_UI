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
    
    //Подсчет количества секций для списка друзей UPD: не пригодилось, вывел через sectionNames.count
//    func numberOfFriendsSections () -> Int {
//        var characters = Set<Character>()
//        //дикая конструкция, скорее всего нифига не KISS
//        for var friend in friends {
//            characters.insert(Character(extendedGraphemeClusterLiteral: friend.name.remove(at: friend.name.startIndex)))
//        }
//
//        return characters.count
//    }
    
    private func sectionsNames () -> [String] {
        var characters = Set<String>()
        //дикая конструкция#2, скорее всего нифига не KISS
        for var friend in friends {
            characters.insert(String(friend.name.remove(at: friend.name.startIndex)))
        }
        return Array(characters)
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
               
        return sectionsNames().count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionsNames().sorted()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendCell

        let friend = friendsInAlphabetOrder[indexPath.section].1[indexPath.row]
        cell.selectionStyle = .none
        cell.friendName.text = friend.name
        cell.friendIcon.image = friend.avatar

        // Configure the cell...
        
        return cell
    }
        
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FriendCell")
        var firstWordsArray = sectionsNames().sorted()
        header?.textLabel?.text = firstWordsArray.removeFirst()

        return header
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var firstWordsArray = sectionsNames().sorted()//вопрос для видеоразбора: это нужно или нет? если все сделать в переменной headerTitle выдаст ошибку Cannot use mutating member on immutable value: function call returns immutable value
        let headerTitle = firstWordsArray.remove(at: section)
        return headerTitle
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
