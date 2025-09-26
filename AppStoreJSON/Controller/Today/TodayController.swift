//
//  TodayController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 9/23/25.
//

import UIKit

class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        collectionView.backgroundColor = .systemGray6
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    var appFullscrennController: AppFullscreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appFullSscreenController = AppFullscreenController()

        let redView = appFullSscreenController.view!
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveView)))
        view.addSubview(redView)

        addChild(appFullSscreenController)
        
        self.appFullscrennController = appFullSscreenController
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        // absolute coordindates off cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startingFrame
//        redView.frame = startingFrame
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = redView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = redView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        redView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {

            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            
            //HidetabBap
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
        }, completion: nil)
       
    }
    
    var startingFrame: CGRect?
    
    @objc func handleRemoveView(gesture: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
//            redView.frame = self.view.frame
            
            self.appFullscrennController.tableView.scrollToRow(at: [0,0], at: .top, animated: true)
            
            /// This ifram code is bad
//            gesture.view?.frame = self.startingFrame ?? .zero
            
            guard let startingFrame = self.startingFrame else { return }
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }

            
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullscrennController.removeFromParent()
            
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
