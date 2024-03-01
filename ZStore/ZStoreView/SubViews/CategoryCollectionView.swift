//
//  CategoryCollectionView.swift
//  ZStore
//
//  Created by APPLE on 27/11/23.
//

import UIKit

//MARK: CategoryCollectionCell
class CategoryCollectionCell: UICollectionViewCell {
    
    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    override func layoutSubviews() {
        layer.cornerRadius = 16
        layer.borderWidth = 1.5
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //setupViews
    func setupViews(){
        self.addSubview(titleLbl)
        titleLbl.clipsToBounds = true
        titleLbl.layer.cornerRadius = 16
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.numberOfLines = 2
    
        //carTypeLbl constraints
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo:  self.leadingAnchor, constant: 1),
            titleLbl.topAnchor.constraint(equalTo:  self.topAnchor, constant: 1),
            titleLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            titleLbl.trailingAnchor.constraint(equalTo:  self.trailingAnchor, constant: 1)
        ])
    }
    
}
