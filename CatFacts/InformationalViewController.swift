//
//  InformationalViewController.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 18/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

import UIKit

class InformationalViewController: UITableViewController {
    
    private let jsonInformation = "https://catfact.ninja/facts?limit=25"
    
    private var information: Cat?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        information?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath)
        
        let info = information?.data?[indexPath.row]
        cell.textLabel?.text = info?.fact
        cell.imageView?.image = UIImage(named: "Catt" )
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   
    func displayOfInformation() {
        guard let info = URL(string: jsonInformation) else { return }
        
        URLSession.shared.dataTask(with: info) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                self.information = try JSONDecoder().decode(Cat.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
