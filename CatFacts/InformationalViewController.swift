//
//  InformationalViewController.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 18/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

import UIKit

class InformationalViewController: UITableViewController {
    
    private let jsonInformation = "https://catfact.ninja/facts?limit=5"
    
    private var information: Cat?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        information?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! InformationCell
        
        let info = information?.data?[indexPath.row]
        cell.informationLabel.text = info?.fact
        return cell
    }
   
    func displayOfInformation() {
        guard let info = URL(string: jsonInformation) else { return }
        
        URLSession.shared.dataTask(with: info) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                self.information = try JSONDecoder().decode(Cat.self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
