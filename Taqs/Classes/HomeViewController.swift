//
//  HomeViewController.swift
//  Taqs
//
//  Created by Salma on 18/06/2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempDescriptionLabel: UILabel!
    @IBOutlet weak var tempDegreeLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var img: UIImageView!{
        didSet{
            //img.image = UIImage(named: "Cloud_sun")
        }
    }
    @IBOutlet weak var dailyForecastTableView: UITableView!{
        didSet{
            dailyForecastTableView.dataSource = self
            dailyForecastTableView.delegate = self
            let nib = UINib(nibName: "DailyForecastTableViewCell", bundle: nil)
            dailyForecastTableView.register(nib, forCellReuseIdentifier: "dailyForecastCell")
            dailyForecastTableView.layer.masksToBounds = true
            dailyForecastTableView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var tableee: UITableView!{
        didSet{
            tableee.dataSource = self
            tableee.delegate = self
            let nib = UINib(nibName: "WeatherIndicatorsTableViewCell", bundle: nil)
            tableee.register(nib, forCellReuseIdentifier: "tablecell")
            tableee.layer.masksToBounds = true
            tableee.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var hourlyForecastCollectionView: UICollectionView!{
        didSet{
            hourlyForecastCollectionView.dataSource = self
            hourlyForecastCollectionView.delegate = self
            let nib1 = UINib(nibName: "HourlyForecastCollectionViewCell", bundle: nil)
            hourlyForecastCollectionView.register(nib1, forCellWithReuseIdentifier: "collectioncell")
            hourlyForecastCollectionView.layer.masksToBounds = true
            hourlyForecastCollectionView.layer.cornerRadius = 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "10-DAY FORECAST"
    }
}

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableee{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! WeatherIndicatorsTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "dailyForecastCell", for: indexPath) as! DailyForecastTableViewCell
            return cell
        }
    }
}
extension HomeViewController: UICollectionViewDelegate{
    
}
extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! HourlyForecastCollectionViewCell
        //cell.imgcollection.image = UIImage(named: "Cloud_sun")
        return cell
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.view.frame.width * 0.20 , height: self.view.frame.height * 0.18)
    }
}

// MARK: - Configurations

private extension HomeViewController {
    func configureAppearance() {
        cityLabel.applyStyle(.header)
        dateLabel.applyStyle(.subtitle)
        tempDescriptionLabel.applyStyle(.title)
        tempDegreeLabel.applyStyle(.header)
        feelsLikeLabel.applyStyle(.subtitle)
    }
}
