//
//  Layouts.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/4/23.
//

import Foundation
import UIKit

class Layouts {
    //singleton
    static let shared = Layouts()
    //layout configuration for the headercell
    func headerSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(320)), subitems: [item])
        let section = NSCollectionLayoutSection.init(group: group)
        return section
    }
    //layout configuration for the body cell
    func bodySection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        //determines how much horizontal padding to apply to the items
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(320)), subitems: [item])
                
        let section = NSCollectionLayoutSection(group: group)
        //how much spacing to apply between the items
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
                
        return section
    }
    
}
