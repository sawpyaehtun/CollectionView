//
//  NetworkingService.swift
//  AlamofireAndGloss
//
//  Created by SawPyaeHtun on 12/19/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import Foundation
import Alamofire
typealias JSON = [String : Any]

class NetworkingService {
    
    static let networkCall = NetworkingService()
    let companyLogo : [UIImage] = [UIImage(named: "one.png")!,
                                   UIImage(named: "two.png")!,
                                   UIImage(named: "three.png")!,
                                   UIImage(named: "four.png")!,
                                   UIImage(named: "five.png")!,
                                   UIImage(named: "six.png")!]
    
    private init(){}
    
    func getCompanies(success successBlock: @escaping ([Company]) -> Void) {
        Alamofire.request("https://api.myjson.com/bins/8d195.json")
            .responseJSON { (response) in
                guard let json = response.result.value as? [JSON] else {print("fail"); return}
                let companies = self.getCompanyArray(json: json)
                successBlock(companies)
        }
    }
    
    func getCompanyArray(json : [JSON]) -> [Company] {
        
        var companies = [] as [Company]
        var i = 0
        for jsonObj in json
        {
            companies.append(Company(json: jsonObj, logo : companyLogo[i])!)
            i += 1
        }
        return companies
    }
    
}

