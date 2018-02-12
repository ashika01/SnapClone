//
//  StoryViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/9/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var myStories = [UIImage]()
    
    //Data Source Protocols
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! StoryTableViewCell
        let story = myStories[indexPath.row]
        cell.storyImage.image = story
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "storyCell")
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "StoryPreview") as? StoryPreviewViewController{
            vc.img = myStories[(tableView.indexPathForSelectedRow?.row)!]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

protocol AddDatatoStoryView {
    func addData(_ image: UIImage)
}

extension StoryViewController: AddDatatoStoryView{
    func addData(_ image: UIImage) {
        self.myStories.append(image)
    }
    
    
}
