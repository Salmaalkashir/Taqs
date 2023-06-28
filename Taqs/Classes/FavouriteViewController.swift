//
//  FavouriteViewController.swift
//  Taqs
//
//  Created by Fatma on 28/06/2023.
//

import UIKit

class FavouriteViewController: UIViewController{
    
    @IBOutlet weak var locationsLabel: UILabel!
    @IBOutlet weak var favouriteLocationsTableView: UITableView!{
        didSet{
            favouriteLocationsTableView.dataSource = self
            favouriteLocationsTableView.delegate = self
            let nib = UINib(nibName: "FavouriteLocationsTableViewCell", bundle: nil)
            favouriteLocationsTableView.register(nib, forCellReuseIdentifier: "favouriteLocationsCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsLabel.applyStyle(.header)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "a") ?? UIImage())
    }

}

extension FavouriteViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteLocationsCell", for: indexPath) as! FavouriteLocationsTableViewCell
        return cell
    }
}

extension FavouriteViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
}
