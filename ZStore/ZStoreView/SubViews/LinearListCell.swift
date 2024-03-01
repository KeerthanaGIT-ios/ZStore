//
//  LinearListCell.swift
//  ZStore
//
//  Created by APPLE on 28/11/23.
//

import UIKit

class LinearListCell: UITableViewCell {
    
    //SubViews
    var listImg = UIImageView()
    var listTitle = UILabel()
    var ratingView = StarRatingView()
    var ratingLbl = UILabel()
    var ratingCountLbl = UILabel()
    var priceLbl = UILabel()
    var dayLbl = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupViews()
    }
    
    func setupViews() {
        //listImg
        listImg.translatesAutoresizingMaskIntoConstraints = false
        addSubview(listImg)
        listImg.backgroundColor = .clear
        listImg.layer.cornerRadius = 20
        listImg.clipsToBounds = true
        
        //listTitle
        listTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(listTitle)
        listTitle.backgroundColor = .clear
        listTitle.textColor = .black
        listTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        listTitle.numberOfLines = 0
        listTitle.lineBreakMode = .byWordWrapping
        
        //ratingLbl
        ratingLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ratingLbl)
        ratingLbl.backgroundColor = .clear
        ratingLbl.font = UIFont.systemFont(ofSize: 13)
        ratingLbl.textColor = UIColor.getCellBorderHighLiteColor()
        
        //ratingView
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ratingView)
        ratingView.backgroundColor = .clear
        
        //ratingCountLbl
        ratingCountLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ratingCountLbl)
        ratingCountLbl.backgroundColor = .clear
        ratingCountLbl.font = UIFont.systemFont(ofSize: 13)
        ratingCountLbl.textColor = UIColor.ratingsColor()
        
        //priceLbl
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(priceLbl)
        priceLbl.backgroundColor = .clear
        priceLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        //dayLbl
        dayLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dayLbl)
        dayLbl.backgroundColor = .clear
        dayLbl.font = UIFont.systemFont(ofSize: 13)
        dayLbl.textColor = .lightGray
        dayLbl.numberOfLines = 0
        dayLbl.lineBreakMode = .byWordWrapping
        
       
        NSLayoutConstraint.activate([listImg.heightAnchor.constraint(equalToConstant: 90),
                                     listImg.widthAnchor.constraint(equalToConstant: 90),
                                     listImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                                     listImg.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                                     
                                     listTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                                     listTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     listTitle.leadingAnchor.constraint(equalTo: listImg.trailingAnchor, constant: 5),
                                     
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
                                     priceLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     
                                     dayLbl.leadingAnchor.constraint(equalTo: priceLbl.leadingAnchor, constant: 0),
                                     dayLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     dayLbl.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 2),
                                     dayLbl.heightAnchor.constraint(equalToConstant: 40)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    return label.frame.height
}
