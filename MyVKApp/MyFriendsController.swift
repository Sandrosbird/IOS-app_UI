//
//  MyFriendsController.swift
//  MyVKApp
//
//  Created by Emil Mescheryakov on 05.04.2020.
//  Copyright © 2020 Emil Mescheryakov. All rights reserved.
//

import UIKit


class MyFriendsController: UITableViewController {

    
    
    var friends = [
        User(name: "Эльвина Мещерякова", avatar: UIImage(named: "girl.png")!, userPhotos: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
        User(name: "Леон Мещеряков", avatar: UIImage(named: "boy.png")!, userPhotos: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
        User(name: "Ильвир Гайнуллин", avatar: UIImage(named: "boy.png")!, userPhotos: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
        User(name: "Айгуль Саетгареева", avatar: UIImage(named: "girl.png")!, userPhotos: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
        User(name: "Кир Горелкин", avatar: UIImage(named: "boy.png")!, userPhotos: [UIImage(named: "girl.png")!, UIImage(named: "boy.png")!, UIImage(named: "girl.png")!]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendCell
        let friend = friends[indexPath.row]
        cell.friendName.text = friend.name
        cell.friendIcon.image = friend.avatar

        // Configure the cell...

        return cell
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
