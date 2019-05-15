//
//  RocketViewModel.swift
//  CaltexRocketApp
//
//  Created by Somya on 13/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import Foundation
import PromiseKit

struct RocketViewModel {
    let name: String?
    let status: String?
    let windowStart: String?
    let launcherStage: LauncherStageModel
    let rocketPad: RocketPadModel
    
    init() {
        self.name = ""
        self.status = ""
        self.windowStart = ""
        self.launcherStage = LauncherStageModel()
        self.rocketPad = RocketPadModel()
    }
    
    init(with rocket: RocketModel) {
        self.name = rocket.name
        self.status = rocket.status?.name
        self.windowStart = rocket.windowStart
        self.rocketPad = rocket.rocketPad!
        if let launcherStage = rocket.rocketInfo.launcherStage?.first  {
            self.launcherStage = launcherStage
        } else {
            self.launcherStage = LauncherStageModel()
        }
    }
    
    func setupViewModel() -> Promise<[RocketViewModel]> {
        var viewModelArray = [RocketViewModel]()
        
        return firstly {
            APIService.sharedInstance.getRocketLaunchDetails()
                .done { resultsModel in
                    for rocketModel in resultsModel.results {
                        let viewModel = RocketViewModel.init(with: rocketModel)
                        viewModelArray.append(viewModel)
                    }
                }
            }.compactMap {
                return viewModelArray
        }
        
    }
}
