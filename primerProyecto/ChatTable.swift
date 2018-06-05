//
//  ChatTable.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 5/6/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class ChatTable: UITableViewController {
    
    let chatCellIdentifier = "chatCellIdentifier"

    override func viewDidLoad( ) {
        super.viewDidLoad()

       setupView()
        
        tableView.register(ChatTableCell.self, forCellReuseIdentifier: chatCellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupView(){
        title = "Chats"
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCellIdentifier", for: indexPath) as! ChatTableCell
            cell.userNameLabel.text = "Text Example number:\(indexPath.row)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
