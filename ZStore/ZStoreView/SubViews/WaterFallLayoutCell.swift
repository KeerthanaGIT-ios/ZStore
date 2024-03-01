//
//  WaterFallLayoutCell.swift
//  ZStore
//
//  Created by APPLE on 02/12/23.
//

import UIKit

class WaterFallLayoutCell: UICollectionViewCell {
    
    //subviews
    var listImg = UIImageView()
    var listTitle = UILabel()
    var ratingView = StarRatingView()
    var ratingLbl = UILabel()
    var ratingCountLbl = UILabel()
    var priceLbl = UILabel()
    var dayLbl = UILabel()
    var favBtn = UIButton(type: .custom)
    var favTaggedBtn = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 23
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.headerColor().cgColor
        //listImg
        listImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(listImg)
        listImg.layer.cornerRadius = 23
        listImg.backgroundColor = UIColor.clear
        listImg.clipsToBounds = true
        listImg.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //listTitle
        listTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(listTitle)
        listTitle.backgroundColor = .clear
        listTitle.textColor = .black
        listTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        listTitle.numberOfLines = 0
        listTitle.lineBreakMode = .byWordWrapping
        
        //ratingLbl
        ratingLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingLbl)
        ratingLbl.backgroundColor = .clear
        ratingLbl.font = UIFont.systemFont(ofSize: 13)
        ratingLbl.textColor = UIColor.getCellBorderHighLiteColor()
        
        //ratingView
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingView)
        ratingView.backgroundColor = .clear

        //ratingCountLbl
        ratingCountLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingCountLbl)
        ratingCountLbl.backgroundColor = .clear
        ratingCountLbl.font = UIFont.systemFont(ofSize: 13)
        ratingCountLbl.textColor = UIColor.ratingsColor()
        
        //priceLbl
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLbl)
        priceLbl.backgroundColor = .clear
        priceLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        //dayLbl
        dayLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayLbl)
        dayLbl.backgroundColor = .clear
        dayLbl.font = UIFont.systemFont(ofSize: 13)
        dayLbl.textColor = .lightGray
        dayLbl.numberOfLines = 0
        dayLbl.lineBreakMode = .byWordWrapping
        
        //favbtn
        favBtn.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favBtn)
        favBtn.backgroundColor = .clear
        favBtn.layer.cornerRadius = 10
        favBtn.layer.borderColor = UIColor.separatorColor().cgColor
        favBtn.layer.borderWidth = 1
        favBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        favBtn.setTitle("Add to Fav", for: .normal)
        favBtn.setImage(UIImage(named: "fav"), for: .normal)
        favBtn.setTitleColor(UIColor.customTitleColor(), for: .normal)
        
        favTaggedBtn.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favTaggedBtn)
        favTaggedBtn.setImage(UIImage(named: "favTag"), for: .normal)
        favTaggedBtn.layer.cornerRadius = 23
        favTaggedBtn.clipsToBounds = true
        favTaggedBtn.backgroundColor = .clear
        favTaggedBtn.layer.maskedCorners = [.layerMaxXMinYCorner]
        favTaggedBtn.isHidden = true
        
        NSLayoutConstraint.activate([listImg.heightAnchor.constraint(equalToConstant: 200),
                                     listImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                                     listImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                                     listImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                                     
                                     listTitle.topAnchor.constraint(equalTo: self.listImg.bottomAnchor, constant: 5),
                                     listTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                                     listTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                                     listTitle.heightAnchor.constraint(equalToConstant: 50),
                                    
                                     ratingLbl.leadingAnchor.constraint(equalTo: listTitle.leadingAnchor, constant: 0),
                                     ratingLbl.widthAnchor.constraint(equalToConstant: 21),
                                     ratingLbl.heightAnchor.constraint(equalToConstant: 18),
                                     ratingLbl.topAnchor.constraint(equalTo: listTitle.bottomAnchor, constant: 2),
                                     
                                     ratingView.leadingAnchor.constraint(equalTo: ratingLbl.trailingAnchor, constant: 5),
                                     ratingView.topAnchor.constraint(equalTo: ratingLbl.topAnchor, constant: 0),
                                     ratingView.heightAnchor.constraint(equalToConstant: 20),
                                     ratingView.widthAnchor.constraint(equalToConstant: 100),
                                     
                                     ratingCountLbl.leadingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: 5),
                                     ratingCountLbl.heightAnchor.constraint(equalToConstant: 18),
                                     ratingCountLbl.topAnchor.constraint(equalTo: ratingView.topAnchor, constant: 0),
                                     ratingCountLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     
                                     priceLbl.leadingAnchor.constraint(equalTo: ratingLbl.leadingAnchor, constant: 0),
                                     priceLbl.heightAnchor.constraint(equalToConstant: 28),
                                     priceLbl.topAnchor.constraint(equalTo: ratingLbl.bottomAnchor, constant: 2),
                                     priceLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     
                                     dayLbl.leadingAnchor.constraint(equalTo: priceLbl.leadingAnchor, constant: 0),
                                     dayLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     dayLbl.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 2),
                                     dayLbl.heightAnchor.constraint(equalToConstant: 40),
                                     
                                     favBtn.heightAnchor.constraint(equalToConstant: 36),
                                     favBtn.widthAnchor.constraint(equalToConstant: 110),
                                     favBtn.leadingAnchor.constraint(equalTo: dayLbl.leadingAnchor, constant: 0),
                                     favBtn.topAnchor.constraint(equalTo: dayLbl.bottomAnchor, constant: 2),
                                     
                                     favTaggedBtn.trailingAnchor.constraint(equalTo: listImg.trailingAnchor, constant: 0),
                                     favTaggedBtn.topAnchor.constraint(equalTo: listImg.topAnchor, constant: 0),
                                     favTaggedBtn.heightAnchor.constraint(equalToConstant: 72),
                                     favTaggedBtn.widthAnchor.constraint(equalToConstant: 75)
                                     ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
