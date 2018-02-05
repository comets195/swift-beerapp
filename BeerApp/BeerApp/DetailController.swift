//
//  DetailController.swift
//  BeerApp
//
//  Created by Mrlee on 2018. 1. 17..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

protocol DetailView {
    func load(data: Beer)
}

class DetailController: UITableViewController {
    @IBOutlet var beerInfoLabels: [UILabel]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var boil_volume: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var brewersView: UITextView!
    
    var beer: Beer?
    override func viewDidLoad() {
        super.viewDidLoad()
        beerInfoLabels[0].text = beer?.name
        beerInfoLabels[1].text = beer?.tagline
        descriptionView.text = beer?.description
        beerInfoLabels[11].text = beer?.first_brewed
        beerInfoLabels[2].text = "\((beer?.abv)!)"
        beerInfoLabels[3].text = "\((beer?.ibu)!)"
        beerInfoLabels[4].text = "\((beer?.target_fg)!)"
        beerInfoLabels[5].text = "\((beer?.target_og)!)"
        beerInfoLabels[6].text = "\((beer?.ebc)!)"
        beerInfoLabels[7].text = "\((beer?.srm)!)"
        beerInfoLabels[8].text = "\((beer?.ph)!)"
        beerInfoLabels[9].text = "\((beer?.attenuation_level)!)"
        brewersView.text = beer?.brewers_tips
        beerInfoLabels[10].text = beer?.contributed_by
        let url = URL(string: (beer?.image_url)!)
        imageView.downloadedFrom(url: url!)
        volume.text = "\((beer?.volume.value)!)" + " \((beer?.volume.unit)!)"
        boil_volume.text = "\((beer?.boil_volume.value)!)" + " \((beer?.boil_volume.unit)!)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 5 && indexPath.row == 0 {
            performSegue(withIdentifier: "brewersTips", sender: self)
        }
        if indexPath.section == 5 && indexPath.row == 1 {
            performSegue(withIdentifier: "method", sender: self)
        }
        if indexPath.section == 5 && indexPath.row == 2 {
            performSegue(withIdentifier: "Ingredients", sender: self)
        }
        if indexPath.section == 5 && indexPath.row == 3 {
            performSegue(withIdentifier: "food_pairing", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailView {
            destination.load(data: BeerData.sharedInstance.beers[(tableView.indexPathForSelectedRow?.row)!])
        }
    }
    
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
