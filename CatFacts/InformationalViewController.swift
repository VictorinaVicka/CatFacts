//
//  InformationalViewController.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 18/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

import UIKit
import Alamofire

class InformationalViewController: UITableViewController {
    
    private let jsonInformation = "https://catfact.ninja/facts?limit=25"
    
    private var information: [Information] = []
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        information.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath)
        
        let info = information[indexPath.row]
        cell.textLabel?.text = info.fact
        cell.selectionStyle = .none
        cell.imageView?.image = UIImage(named: "Catt" )
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   
    func fetchDataWithAlamofire() {
        guard let info = URL(string: jsonInformation) else { return }
        
        request(info).validate().responseJSON { dataResponse in
            
            switch dataResponse.result {
            case .success(let value):
                self.information = Information.getCat(from: value)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
