//
//  CompanyCellCollectionViewCell.swift
//  MyCollectionView
//
//  Created by SawPyaeHtun on 12/27/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import UIKit

protocol CompanyViewDetailDelegate {
    func viewDetailBtnTapped(company : Company)
}

class CompanyCell: UICollectionViewCell {
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var viewDetailBtn: UIButton!
    var companyViewDetailDelegte : CompanyViewDetailDelegate! = nil
    var companyItem : Company!
    
    func setupCell (company : Company) {
        self.companyItem = company
        companyLogo.image = company.logo
    }
    
    @IBAction func viewDetailTap(_ sender: Any) {
        companyViewDetailDelegte.viewDetailBtnTapped(company: companyItem)
    }
    
    
}
