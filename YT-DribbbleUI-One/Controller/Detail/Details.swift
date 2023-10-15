//
//  Details.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/14/23.
//

import Foundation
import UIKit

class Details: UIViewController {
    var product: Product? {
            didSet{
                manageData()
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(named: "bgGray")
        configViews()
        configConstraints()
        manageData()
        // Do any additional setup after loading the view.
        }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.isNavigationBarHidden = true
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            navigationController?.isNavigationBarHidden = true
        }
    
    
    let backButton: UIButton = {
        var button = UIButton()
        let image = UIImage(systemName: "chevron.backward")
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleBackBtn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
       }()
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Details"
        label.font = .preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    let menuButton: UIButton = {
        var button = UIButton()
        let image = UIImage(named: "lith")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
       }()
    
    let productView: ProductDetails = {
        var view = ProductDetails()
        view.backgroundColor = .white
        view.layer.cornerRadius = 48
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let priceView: PriceView = {
        var view = PriceView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func handleBackBtn(){
        DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
        }
        }
    
    func configViews(){
        view.addSubview(backButton)
        view.addSubview(detailsLabel)
        view.addSubview(menuButton)
        view.addSubview(productView)
        view.addSubview(priceView)
    }
    func configConstraints(){
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(
            equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
        backButton.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
        
        backButton.heightAnchor.constraint(equalToConstant: 32),
        backButton.widthAnchor.constraint(equalToConstant: 32),
        
        detailsLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        menuButton.heightAnchor.constraint(equalToConstant: 20),
        menuButton.widthAnchor.constraint(equalToConstant: 20),
        menuButton.centerYAnchor.constraint(equalTo: detailsLabel.centerYAnchor),
        view.trailingAnchor.constraint(
            equalToSystemSpacingAfter: menuButton.trailingAnchor, multiplier: 3),
        productView.topAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 6),
        productView.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
        
        priceView.bottomAnchor.constraint(equalTo: productView.bottomAnchor),
        
        priceView.leadingAnchor.constraint(
            equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
        
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: priceView.trailingAnchor, multiplier: 0),
        priceView.heightAnchor.constraint(equalToConstant: 200),
        
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: productView.trailingAnchor, multiplier: 0),
        view.bottomAnchor.constraint(equalToSystemSpacingBelow: productView.bottomAnchor, multiplier: 0),
        
        
        
        ])
    }
    
    func manageData(){
        priceView.products = product
        productView.products = product
        }
}
