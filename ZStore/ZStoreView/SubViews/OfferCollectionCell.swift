//
//  OfferCollectionCell.swift
//  ZStore
//
//  Created by APPLE on 27/11/23.
//

import UIKit

class OfferCollectionCell: UICollectionViewCell {
    
    //subViews
    var bgView = UIView()
    var img = UIImageView()
    var offerDescriptionTxt = UILabel()
    var offerTxt = UILabel()
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         self.setupViews()
     }
    
    func setupViews() {
        //bgView
        bgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bgView)
        bgView.backgroundColor = .orange
        bgView.layer.cornerRadius = 20
        
        //offerDescriptionTxt
        offerDescriptionTxt.translatesAutoresizingMaskIntoConstraints = false
        bgView.addSubview(offerDescriptionTxt)
        offerDescriptionTxt.textColor = UIColor.white
        offerDescriptionTxt.backgroundColor = .clear
        offerDescriptionTxt.numberOfLines = 0
        offerDescriptionTxt.lineBreakMode = .byWordWrapping
        offerDescriptionTxt.font = UIFont.systemFont(ofSize: 16)
      
        //img
        img.translatesAutoresizingMaskIntoConstraints  = false
        bgView.addSubview(img)
        img.backgroundColor = .lightGray
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
       
        //offerDescriptionTxt
        offerTxt.translatesAutoresizingMaskIntoConstraints = false
        bgView.addSubview(offerTxt)
        offerTxt.textColor = UIColor.white
        offerTxt.backgroundColor = .clear
        offerTxt.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        //Constraints
        NSLayoutConstraint.activate([bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                                     bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
                                     bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
                                     bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
                                     img.heightAnchor.constraint(equalToConstant: 90),
                                     img.widthAnchor.constraint(equalToConstant: 90),
                                     img.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 10),
                                     img.centerYAnchor.constraint(equalTo: bgView.centerYAnchor, constant: 0),
                                     offerDescriptionTxt.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5),
                                     offerDescriptionTxt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     offerDescriptionTxt.trailingAnchor.constraint(equalTo: img.leadingAnchor, constant: -10),
                                     offerTxt.heightAnchor.constraint(equalToConstant: 30),
                                     offerTxt.leadingAnchor.constraint(equalTo: offerDescriptionTxt.leadingAnchor, constant: 0),
                                     offerTxt.topAnchor.constraint(equalTo: offerDescriptionTxt.bottomAnchor, constant: 5),
                                     offerTxt.trailingAnchor.constraint(equalTo: offerDescriptionTxt.trailingAnchor, constant: 0)])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
