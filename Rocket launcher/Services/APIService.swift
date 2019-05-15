//
//  APIService.swift
//  CaltexRocketApp
//
//  Created by Somya on 13/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import Foundation
import PromiseKit

struct APIService {
    let baseURL = "https://spacelaunchnow.me/api/3.3.0/launch/upcoming/?format=json"
    static let sharedInstance = APIService()
    
    func getRocketLaunchDetails() -> Promise<ResultsModel> {
        let url = URL(string: baseURL)!
        
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }.compactMap {
            return try JSONDecoder().decode(ResultsModel.self, from: $0.data)
        }
    }
}
