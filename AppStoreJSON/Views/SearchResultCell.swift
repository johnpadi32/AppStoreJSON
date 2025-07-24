//
//  SearchResultCell.swift
//  AppStoreJSON
//
//  Created by John Padilla on 4/17/25.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            
            if appResult.screenshotUrls.count > 0 {
                screenshop1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            }
            
            if appResult.screenshotUrls.count > 1 {
                screenshop2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshop3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    //MARK: - Properties
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Videos"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshop1ImageView = self.createScreenshotImageView()
    lazy var screenshop2ImageView = self.createScreenshotImageView()
    lazy var screenshop3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // optional
        
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        labelStackView.axis = .vertical
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getButton])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshop1ImageView, screenshop2ImageView, screenshop3ImageView])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overrallStackView = UIStackView(arrangedSubviews: [infoTopStackView, screenshotsStackView])
        overrallStackView.axis = .vertical
        overrallStackView.spacing = 16
        
        addSubview(overrallStackView)
        overrallStackView.fillSuperView(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
