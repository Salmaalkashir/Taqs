//
//  HomeViewController.swift
//  Taqs
//
//  Created by Salma on 18/06/2023.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tableee: UITableView!
    {
        didSet
        {
            tableee.dataSource = self
            tableee.delegate = self
        }
    }
    @IBOutlet weak var collectionn: UICollectionView!
    {
        didSet
        {
            collectionn.dataSource = self
            collectionn.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableee.register(nib, forCellReuseIdentifier: "tablecell")
        
        let nib1 = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionn.register(nib1, forCellWithReuseIdentifier: "collectioncell")
        
        img.image = UIImage(named: "Cloud_sun")

        
    }

}
extension HomeViewController : UITableViewDelegate
{
    
}

extension HomeViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! TableViewCell
        return cell
    }
    
    
}
extension HomeViewController: UICollectionViewDelegate
{
    
}
extension HomeViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! CollectionViewCell
        cell.imgcollection.image = UIImage(named: "Cloud_sun")
        return cell
    }
    
    
}
