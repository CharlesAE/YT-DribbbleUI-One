//
//  Product.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/4/23.
//

import Foundation

struct Product{
    
    let image: String
    let price: String
    let title: String
    let subtitle: String

    
    static let products:[Product] = [
        Product(image:"camera",price: "891.99",title: "EOS M50 Mark II",  subtitle: "EF-M mount. DIGIC 8"),
        Product(image:"playstation",price: "499.99",title: "PS5 Controller",  subtitle: "Play Has No Limits"),
        Product(image:"switch",price: "349.99",title: "Switch Controller",  subtitle: "Switch and Play"),
        ]
}
