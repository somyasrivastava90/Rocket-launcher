//
//  RocketModel.swift
//  Rocket launcher
//
//  Created by Somya on 13/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import Foundation

struct ResultsModel: Codable {
    let count: Int
    let results: [RocketModel]
}

struct RocketModel: Codable {
    var name: String?
    var status: StatusModel?
    var windowStart: String?
    var rocketInfo: RocketInfo
    var rocketPad: RocketPadModel?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case status = "status"
        case windowStart = "window_start"
        case rocketInfo = "rocket"
        case rocketPad = "pad"
    }
}

struct StatusModel: Codable {
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct RocketInfo: Codable {
    var launcherStage: [LauncherStageModel]?
    
    enum CodingKeys: String, CodingKey {
        case launcherStage = "launcher_stage"
    }
    
    init() {
        self.launcherStage = [LauncherStageModel]()
    }
}

struct LauncherStageModel: Codable {
    var launcher: LauncherModel
    
    enum CodingKeys: String, CodingKey {
        case launcher = "launcher"
    }
    
    init() {
        self.launcher = LauncherModel()
    }
}

struct LauncherModel: Codable {
    var details: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case details = "details"
        case imageUrl = "image_url"
    }
    
    init() {
        self.details = ""
        self.imageUrl = ""
    }
}

struct RocketPadModel: Codable {
    var location: LocationModel
    
    init() {
        self.location = LocationModel()
    }
}

struct LocationModel: Codable {
    var name: String?
    var countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
    }
    
    init() {
        self.name = ""
        self.countryCode = ""
    }
}


