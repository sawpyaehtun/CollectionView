//
//  ViewController.swift
//  MyCollectionView
//
//  Created by SawPyaeHtun on 12/27/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var companyCollectionV: UICollectionView!
    var company = [Company] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Companies"
        NetworkingService.networkCall.getCompanies { (company) in
            self.company = company
            self.companyCollectionV.reloadData()
        }
    }
}

extension MainViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return company.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CompanyCell.self), for: indexPath) as? CompanyCell else {return UICollectionViewCell()}
        cell.setupCell(company: company[indexPath.row])
        cell.companyViewDetailDelegte = self
        return cell
    }
}

extension MainViewController : CompanyViewDetailDelegate
{
    func viewDetailBtnTapped(company: Company) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CompanyDetailVC.self)) as! CompanyDetailVC
        vc.company = company
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

