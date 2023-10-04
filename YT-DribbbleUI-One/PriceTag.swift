//
//  PriceTag.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/4/23.
//

import Foundation
import UIKit

class PriceTag: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let priceLabel: UILabel = {
    let priceLabel = UILabel()
    priceLabel.numberOfLines = 0
    priceLabel.textColor = .black
    priceLabel.font = .systemFont(ofSize: 17, weight: .semibold)
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    return priceLabel
    }()
    
    let priceIcon: UIImageView = {
    var priceIcon = UIImageView()
    priceIcon.image = UIImage(systemName: "dollarsign.circle",withConfiguration: UIImage.SymbolConfiguration(weight: .light))
    priceIcon.tintColor = .red
    priceIcon.contentMode = .scaleAspectFit
    priceIcon.translatesAutoresizingMaskIntoConstraints = false
    return priceIcon
        }()
    
    func configViews(){
        addSubview(priceIcon)
        addSubview(priceLabel)
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
            priceIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceIcon.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            priceIcon.widthAnchor.constraint(equalToConstant: 25),
            priceIcon.heightAnchor.constraint(equalToConstant: 25),
                        
            priceLabel.centerYAnchor.constraint(equalTo: priceIcon.centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: priceIcon.trailingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: priceLabel.trailingAnchor, multiplier: 2)
        ])
    }
}
