//
//  CategoryView.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 9/26/23.
//

import UIKit

//CategoryView inherts from UIView
class CategoryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
        configConstraints()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//This view contains a UILabel,
// which will be used to set the text for the 'pills'
    var categoryLbl: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func configViews(){
//The view's corners are rounded to give it the 'pill' shape
        layer.cornerRadius = 16
//The label is added to the parent view
        addSubview(categoryLbl)
    }
    
    func configConstraints(){
//The label is then then centered horizontally within the view
//with 24 pts of space from the view's leading and trailing anchors
        NSLayoutConstraint.activate([
            categoryLbl.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            categoryLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: categoryLbl.trailingAnchor, multiplier: 3)
        ])
    }

}
