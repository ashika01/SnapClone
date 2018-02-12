//
//  FriendsTableViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/11/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
       var friends = ["john", "appleseed", "regina", "richard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FriendTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "friendCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FriendTableViewCell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        let friend = friends[indexPath.row]
        cell.friendImage.image = UIImage(named: "\(friend)")
        cell.friendName.text = friend
        return cell
    }
   
}
