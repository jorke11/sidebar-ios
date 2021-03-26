//
//  MenuOptionsCell.swift
//  SideBar
//
//  Created by Jorge Pinedo on 6/26/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
    
        iv.clipsToBounds = true
        return iv
    }()
    
    let labelDescription:UILabel  = {
        let label  = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "text example"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        
        selectionStyle = .none
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        addSubview(labelDescription)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelDescription.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
