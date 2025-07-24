//
//  AppRowCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 7/23/25.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

class AppRowCell: UICollectionViewCell {

    //MARK: - Properties
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32 / 2
        
        let verticalStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        verticalStackView.spacing = 4
        verticalStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [imageView, verticalStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
