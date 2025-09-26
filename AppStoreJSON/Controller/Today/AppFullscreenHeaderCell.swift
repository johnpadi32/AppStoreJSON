//
//  AppFullscreenHeaderCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/26/25.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.remove, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperView()
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, right: rightAnchor, paddingTop: 12, paddingRight: 16, width: 80, height: 38)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
