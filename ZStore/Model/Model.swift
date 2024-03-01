//
//  Model.swift
//  ZStore
//
//  Created by APPLE on 29/11/23.
//

struct Category: Codable {
    let id:String
    let name:String
    let layout:String
}

struct CardOffer: Codable {
    let id:String
    let percentage:Double
    let cardName:String
    let offerDescription:String
    let maxDiscount:String
    let imageUrl:String
}

struct Product: Codable {
    let id:String
    let name:String
    let rating:Double
    let reviewCount:Int
    let price:Int
    let categoryId:String
    let cardOfferIds:[String]
    let imageUrl:String
    let description:String
    let layout:String
}
