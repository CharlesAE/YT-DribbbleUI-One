//
//  PriceView.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/14/23.
//

import Foundation
import UIKit

class PriceView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        //layer.cornerRadius = 48
        configViews()
        configConstraints()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 48)
    }
    
    var products: Product? {
            didSet{
                manageData()
            }
        }
    
    let bgView: CAShapeLayer = {
        let layer = CAShapeLayer()
        let x: CGFloat = 25
        let y: CGFloat = 100
        
        layer.path = UIBezierPath(roundedRect:
        CGRect(x: x, y: y,
        width: x - 50,
        height: 100),
        cornerRadius: 16).cgPath
        layer.fillColor = UIColor.black.cgColor
        return layer
    }()
    let pricesStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy Now", for: .normal)
        //btn.semanticContentAttribute = .forceRightToLeft
        //btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        btn.setTitleColor(.white, for: .normal)
        btn.setImage(UIImage(systemName: "arrow.right")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = UIColor(named: "orangeColor")
        btn.layer.cornerRadius = 16
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageView?.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let nowView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let beforeView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let nowPriceTitle: UILabel = {
        let priceTitle = UILabel()
        priceTitle.text = "Now (20% Dis.)"
        priceTitle.font = .preferredFont(forTextStyle: .callout)
        priceTitle.textColor = .white
        priceTitle.translatesAutoresizingMaskIntoConstraints = false
        return priceTitle
    }()
    
    let beforePriceTitle: UILabel = {
        let priceTitle = UILabel()
        priceTitle.text = "Before"
        priceTitle.font = .preferredFont(forTextStyle: .callout)
        priceTitle.textColor = .systemGray2
        priceTitle.translatesAutoresizingMaskIntoConstraints = false
        return priceTitle
    }()
    let nowPrice: PriceTag = {
        let lb = PriceTag()
        lb.priceLabel.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let beforePrice: PriceTag = {
        let lb = PriceTag()
        lb.priceLabel.textColor = .systemGray2
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let heartButton: UIButton = {
        var button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .light, scale: .large)
        let image = UIImage(systemName: "heart.fill", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.tintColor = UIColor(named: "orangeColor")
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews(){
        
        addSubview(pricesStackView)
        
        pricesStackView.addArrangedSubview(nowView)
        pricesStackView.addArrangedSubview(beforeView)
        pricesStackView.addArrangedSubview(heartButton)
        
        nowView.addSubview(nowPriceTitle)
        nowView.addSubview(nowPrice)
        
        
        beforeView.addSubview(beforePriceTitle)
        beforeView.addSubview(beforePrice)
        
        addSubview(buyButton)
        
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            pricesStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            pricesStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 4),
            pricesStackView.heightAnchor.constraint(equalToConstant: 50),
            trailingAnchor.constraint(equalToSystemSpacingAfter: pricesStackView.trailingAnchor, multiplier: 4),
            
            nowView.heightAnchor.constraint(equalToConstant: 32),
            
            
            nowPriceTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: nowView.leadingAnchor, multiplier: 0),
            nowPriceTitle.centerYAnchor.constraint(equalTo: nowView.centerYAnchor),
            nowPrice.topAnchor.constraint(equalToSystemSpacingBelow: nowPriceTitle.bottomAnchor, multiplier: 2),
            nowView.trailingAnchor.constraint(equalToSystemSpacingAfter: nowPriceTitle.trailingAnchor, multiplier: 0),
            
            beforeView.heightAnchor.constraint(equalToConstant: 32),
            beforePriceTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: beforeView.leadingAnchor, multiplier: 0),
            beforePriceTitle.centerYAnchor.constraint(equalTo: beforeView.centerYAnchor),
            beforeView.trailingAnchor.constraint(equalToSystemSpacingAfter: beforePriceTitle.trailingAnchor, multiplier: 0),
            beforePrice.topAnchor.constraint(equalToSystemSpacingBelow: beforePriceTitle.bottomAnchor, multiplier: 2),
            
            heartButton.centerYAnchor.constraint(equalTo: pricesStackView.centerYAnchor),
            heartButton.widthAnchor.constraint(equalToConstant: 40),
            heartButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            buyButton.topAnchor.constraint(equalToSystemSpacingBelow: pricesStackView.bottomAnchor, multiplier: 4),
            buyButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            buyButton.heightAnchor.constraint(equalToConstant: 60),
            buyButton.imageView!.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor),
            buyButton.trailingAnchor.constraint(equalToSystemSpacingAfter: buyButton.imageView!.trailingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: buyButton.trailingAnchor, multiplier: 4),
            
        ])
        
    }
    
    func manageData(){
        
        guard let product = products else { return }
        nowPrice.priceLabel.text = product.price
        let discount = Double(product.price)! / 0.80
        beforePrice.priceLabel.text = String(format: "%.1f", discount)
        }
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
