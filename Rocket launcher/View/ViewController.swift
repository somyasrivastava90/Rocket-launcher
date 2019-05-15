//
//  ViewController.swift
//  CaltexRocketApp
//
//  Created by Somya on 13/5/19.
//  Copyright © 2019 MobileDEN. All rights reserved.
//

import UIKit
import SVProgressHUD
import PromiseKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var viewModels = [RocketViewModel]()
    fileprivate var selectedViewModel: RocketViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
        let viewModel = RocketViewModel()
        viewModel.setupViewModel()
            .done { [weak self] rocketViewModels in
                self?.viewModels = rocketViewModels
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    SVProgressHUD.dismiss()
                }
            }.catch { [weak self] error in
                guard let self = self else { return }
                SVProgressHUD.dismiss()
                self.showAlertView(with: error)
        }
    }
    
    fileprivate func showAlertView(with error: Error) {
        let alertController = UIAlertController(title: "Error!",
                                                message: "\(error.localizedDescription)",
            preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RocketListTableViewCell") as! RocketListTableViewCell
        cell.setupCellUI(with: viewModel.launcherStage.launcher.imageUrl!, name: viewModel.name ?? "", location: viewModel.rocketPad.location.name ?? "")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
        
        self.selectedViewModel = self.viewModels[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.viewModel = self.selectedViewModel
    }
}
