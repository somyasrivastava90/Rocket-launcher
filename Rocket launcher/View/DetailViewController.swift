//
//  DetailViewController.swift
//  Rocket launcher
//
//  Created by Somya on 13/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import SVProgressHUD

enum CountryCode : String {
    case RUS = "RUS"
    case CHN = "CHN"
    case UKN = "UKN"
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var rocketLocationLabel: UILabel!
    @IBOutlet weak var rocketStatusLabel: UILabel!
    @IBOutlet weak var rocketDescriptionLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    public var viewModel: RocketViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
        
        self.rocketImageView.sd_setImage(with: URL(string:viewModel.launcherStage.launcher.imageUrl ?? ""), placeholderImage: #imageLiteral(resourceName: "largeRocketIcon"))
        self.rocketNameLabel.text = viewModel.name
        self.rocketLocationLabel.text = viewModel.rocketPad.location.name
        self.rocketStatusLabel.text = "Status: \(viewModel.status ?? "")"
        var rocketDescription = viewModel.launcherStage.launcher.details
        if rocketDescription == "" {
            rocketDescription = "No details available"
        }
        self.rocketDescriptionLabel.text = rocketDescription
        
        let dateTimeString = convertStringToReadableDateAndTime(with: viewModel.windowStart!)
        self.dateTimeLabel.text = dateTimeString
        
        self.markLaunchesAsImportant()
    }
    
    @IBAction fileprivate func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController {
    fileprivate func convertStringToReadableDateAndTime(with string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
        guard let date = dateFormatter.date(from: string) else { return "" }
        
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = "dd MMM yyyy / hh : mm"
        
        return displayDateFormatter.string(from: date)
    }
    
    fileprivate func markLaunchesAsImportant() {
        let countryCode = viewModel.rocketPad.location.countryCode
        switch countryCode {
        case CountryCode.RUS.rawValue:
            self.flagImageView.image = #imageLiteral(resourceName: "flagIcon")
        case CountryCode.CHN.rawValue:
            self.flagImageView.image = #imageLiteral(resourceName: "flagIcon")
        case CountryCode.UKN.rawValue:
            self.flagImageView.image = #imageLiteral(resourceName: "flagIcon")
        default:
            self.flagImageView.isHidden = true
        }
    }
}
