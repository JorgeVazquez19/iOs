//
//  ChatTableCell.swift
//  primerProyecto
//
//  Created by JORGE VAZQUEZ REQUEJO on 5/6/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class ChatTableCell: UITableViewCell {
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username text"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "usuario")
        iv.layer.cornerRadius=25
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        label.textAlignment = .right
        label.backgroundColor = .red
        label.text = "12:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("MAL")
    }
    
    fileprivate func setupView(){
        
        addSubview(userNameLabel)
        addSubview(profileImage)
        addSubview(messageLabel)
        addSubview(timeLabel)
        
        profileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        timeLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant:8).isActive = true
        userNameLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor, constant:-8).isActive = true
    }
}
