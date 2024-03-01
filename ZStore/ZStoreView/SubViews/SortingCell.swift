//
//  SortingCell.swift
//  ZStore
//
//  Created by APPLE on 02/12/23.
//

import UIKit
//cancelCustomCell
class SortCell: UITableViewCell{
    
    var titleLbl = UILabel()
    var selectOption = UIImageView()
    var titleImg = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLbl)
        titleLbl.backgroundColor = .clear
        titleLbl.textColor = .black
        titleLbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        selectOption = UIImageView()
        selectOption.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(selectOption)
        selectOption.layer.cornerRadius = 6.5
        selectOption.backgroundColor = .clear
        
        titleImg = UIImageView()
        titleImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleImg)
        titleImg.backgroundColor = .clear
        
        
        //constraints
        NSLayoutConstraint.activate([titleImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                                     titleImg.heightAnchor.constraint(equalToConstant: 36),
                                     titleImg.widthAnchor.constraint(equalToConstant: 36),
                                     titleImg.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor, constant: 0),
                                     
                                     titleLbl.leadingAnchor.constraint(equalTo: titleImg.trailingAnchor, constant: 10),
                                     titleLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
                                     titleLbl.heightAnchor.constraint(equalToConstant: 22),
                                     titleLbl.trailingAnchor.constraint(equalTo: selectOption.leadingAnchor, constant: -10),
                                     
                                     selectOption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                                     selectOption.heightAnchor.constraint(equalToConstant: 40),
                                     selectOption.widthAnchor.constraint(equalToConstant: 40),
                                     selectOption.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor, constant: 0)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
