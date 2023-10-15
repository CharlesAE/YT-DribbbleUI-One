//
//  BodyCell.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/4/23.
//

import Foundation
import UIKit

class BodyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        configViews()
        configConstraints()
    }
    
    var products: Product? {
            didSet{
                manageData()
            }
        }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let productContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let productImage: UIImageView = {
        var productImg = UIImageView()
        productImg.backgroundColor = .white
        productImg.contentMode = .scaleAspectFit
        productImg.clipsToBounds = true
        productImg.layer.cornerRadius = 10
        productImg.translatesAutoresizingMaskIntoConstraints = false
        return productImg
    }()
    
    let productTitle: UILabel = {
        let productTitle = UILabel()
        productTitle.numberOfLines = 2
        productTitle.lineBreakMode = .byWordWrapping
        productTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        productTitle.textColor = .black
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        return productTitle
    }()
    let productSubtitle: UILabel = {
        let productSubtitle = UILabel()
        productSubtitle.numberOfLines = 0
        productSubtitle.font = .preferredFont(forTextStyle: .subheadline)
        productSubtitle.textColor = .systemGray3
        productSubtitle.translatesAutoresizingMaskIntoConstraints = false
        return productSubtitle
    }()
    
    let productPrice: PriceTag = {
        let lb = PriceTag()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private func configViews(){
        
        addSubview(productImage)
        addSubview(productContainer)
        [productPrice, productTitle, productSubtitle].forEach {
            productContainer.addSubview($0)
        }
        
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            productImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            productImage.heightAnchor.constraint(equalToConstant: 180),
            trailingAnchor.constraint(equalToSystemSpacingAfter: productImage.trailingAnchor, multiplier: 2),
            
            productContainer.topAnchor.constraint(equalToSystemSpacingBelow: productImage.bottomAnchor, multiplier: 1),
            productContainer.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            productContainer.heightAnchor.constraint(equalToConstant: 80),
            trailingAnchor.constraint(equalToSystemSpacingAfter: productContainer.trailingAnchor, multiplier: 2),
            
            productPrice.topAnchor.constraint(equalToSystemSpacingBelow: productContainer.topAnchor, multiplier: 2),
            productTitle.topAnchor.constraint(equalToSystemSpacingBelow: productPrice.bottomAnchor, multiplier: 3),
            productSubtitle.topAnchor.constraint(equalToSystemSpacingBelow: productTitle.bottomAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: productContainer.bottomAnchor, multiplier: 3)
        ])
    }
    
    func manageData(){
        
        guard let product = products else { return }
        productPrice.priceLabel.text = product.price
        productTitle.text = product.title
        productSubtitle.text = product.subtitle
        productImage.image = UIImage(named: product.image)?.withRenderingMode(.alwaysOriginal)
        }
    
    
}
