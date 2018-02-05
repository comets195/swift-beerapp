//
//  ViewController.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private var isMoreDataDownloading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BeerData.sharedInstance.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = BeerData.sharedInstance.beers[indexPath.row].name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailController {
            destination.beer = BeerData.sharedInstance.beers[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    private func downloadJSON(completed: @escaping () -> ()) {
        let apiUrl = URL(string: "https://api.punkapi.com/v2/beers")
        guard let url = apiUrl else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    for item in try JSONDecoder().decode([Beer].self, from: data!) {
                         BeerData.sharedInstance.beers.append(item)
                    }
                    DispatchQueue.main.async {
                        completed()
                    }
                    self.isMoreDataDownloading = false
                } catch let error {
                    print(error.localizedDescription)
                    print("JSON Error")
                }
            }
            }.resume()
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("y:",scrollView.contentOffset.y)
        print("height:",scrollView.contentSize.height)
        print("boundsHeight:",tableView.bounds.height)
        print("defference:",scrollView.contentSize.height - tableView.bounds.height)
        guard !isMoreDataDownloading else { return }
        if scrollView.contentOffset.y > scrollView.contentSize.height - tableView.bounds.height {
            isMoreDataDownloading = true
            downloadJSON {
                self.tableView.reloadData()
            }
        }
    }
}

