//
//  ViewController.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 9/26/23.
//

import UIKit


class HomeController: UICollectionViewController {

let headerCell = "HeaderCell"
let bodyCell = "BodyCell"
let products = Product.products
override func viewDidLoad() {
      super.viewDidLoad()
      collectionView.backgroundColor = UIColor(named: "bgGray")
      collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: headerCell)
    collectionView.register(BodyCell.self, forCellWithReuseIdentifier: bodyCell)
    }

    init() {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
                    
                    if sectionNumber == 0 {
                        //return header layout
                        return Layouts.shared.headerSection()
                    } else {
                        //return body layout
                        return Layouts.shared.bodySection()
                    }
                }
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //let collectionview know that it will have 2 sections now
    // first section is the header
    // section section is the body
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    // section at index 0 (the header), will only have one item
    // section at index 1 (the body),
    // will have the same number of items in the products array.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0
        {
        return 1
        }
        else
        {
        return products.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product: Product?
        let detailController = Details()
        if indexPath.section == 1 {
            
            product = products[indexPath.item]
            detailController.product = product
        }
        
        navigationController?.pushViewController(detailController, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCell, for: indexPath) as! HeaderCell
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bodyCell, for: indexPath) as! BodyCell
                cell.products = products[indexPath.row]
                return cell
         }
    }
    
}
