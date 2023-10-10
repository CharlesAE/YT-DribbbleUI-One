//
//  ProductDetails.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/14/23.
//

import Foundation
import UIKit

class ProductDetails: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 48
        configViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var products: Product? {
            didSet{
                manageData()
            }
        }
    
    let productContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let productImage: UIImageView = {
        var productImg = UIImageView()
        //productImg.image = UIImage(named: "camera")?.withRenderingMode(.alwaysOriginal)
        productImg.backgroundColor = .white
        
        productImg.contentMode = .scaleAspectFit
        productImg.clipsToBounds = true
        productImg.layer.cornerRadius = 10
        productImg.translatesAutoresizingMaskIntoConstraints = false
        return productImg
    }()
    
    let productTitle: UILabel = {
        let productTitle = UILabel()
        productTitle.font = .preferredFont(forTextStyle: .largeTitle)
        productTitle.textColor = .black
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        return productTitle
    }()
    let productSubtitle: UILabel = {
        let productSubtitle = UILabel()
        productSubtitle.font = .preferredFont(forTextStyle: .title2)
        productSubtitle.textColor = .systemGray2
        productSubtitle.translatesAutoresizingMaskIntoConstraints = false
        return productSubtitle
    }()
    
    var blackCategory: CategoryView = {
        let category = CategoryView()
        category.categoryLbl.text = "Black"
        category.categoryLbl.textColor = .white
        category.backgroundColor = .black
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()

    var whiteCategory: CategoryView = {
        let category = CategoryView()
        category.categoryLbl.text = "White"
        category.categoryLbl.textColor = .black
        category.backgroundColor = UIColor(named: "buttonGray")
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()

    let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func configViews(){
        addSubview(productContainer)
        [productTitle, productSubtitle, productImage].forEach {
            productContainer.addSubview($0)
        }
        addSubview(categoryStackView)
        [whiteCategory, blackCategory].forEach {
            categoryStackView.addArrangedSubview($0)
        }
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            productContainer.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            productContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            productContainer.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            productContainer.heightAnchor.constraint(equalToConstant: 300),
            trailingAnchor.constraint(equalToSystemSpacingAfter: productContainer.trailingAnchor, multiplier: 2),
            
            productImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            productTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            productSubtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            
            productTitle.topAnchor.constraint(equalToSystemSpacingBelow: productContainer.topAnchor, multiplier: 3),
            productSubtitle.topAnchor.constraint(equalToSystemSpacingBelow: productTitle.bottomAnchor, multiplier: 2),
            productImage.topAnchor.constraint(equalToSystemSpacingBelow: productSubtitle.bottomAnchor, multiplier: 2),
            productImage.heightAnchor.constraint(equalToConstant: 250),
            
            categoryStackView.topAnchor.constraint(equalToSystemSpacingBelow: productImage.bottomAnchor, multiplier: 3),
            //categoryStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 8),
            categoryStackView.heightAnchor.constraint(equalToConstant: 32),
            categoryStackView.centerXAnchor.constraint(equalTo: productContainer.centerXAnchor),
            categoryStackView.widthAnchor.constraint(equalToConstant: 200),
            //trailingAnchor.constraint(equalToSystemSpacingAfter: categoryStackView.trailingAnchor, multiplier: 8),
                        
            
            blackCategory.heightAnchor.constraint(equalToConstant: 32),
            whiteCategory.heightAnchor.constraint(equalToConstant: 32),
            bottomAnchor.constraint(equalToSystemSpacingBelow: productContainer.bottomAnchor, multiplier: 3)
        ])
    }
    
    func manageData(){
        
        guard let product = products else { return }
        productTitle.text = product.title
        productSubtitle.text = product.subtitle
        productImage.image = UIImage(named: product.image)?.withRenderingMode(.alwaysOriginal)
        }
}
