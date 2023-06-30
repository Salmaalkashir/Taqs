//
//  HomeViewController.swift
//  Taqs
//
//  Created by Salma on 18/06/2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    var city : [String]?
    var viewModel : ViewModel?
    var forecast : Forecast?
    var date : Date?
    var hours : Date?
    var days : Date?
    var day : [String]?
    let dateFormatter : DateFormatter = DateFormatter()
    let hoursFormatter : DateFormatter = DateFormatter()
    var arr : [String]?
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempDescriptionLabel: UILabel!
    @IBOutlet weak var tempDegreeLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
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
    @IBOutlet weak var weatherIndicatorsTableView: UITableView!{
        didSet{
            weatherIndicatorsTableView.dataSource = self
            weatherIndicatorsTableView.delegate = self
            let nib = UINib(nibName: "WeatherIndicatorsTableViewCell", bundle: nil)
            weatherIndicatorsTableView.register(nib, forCellReuseIdentifier: "tablecell")
            weatherIndicatorsTableView.layer.masksToBounds = true
            weatherIndicatorsTableView.layer.cornerRadius = 20
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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bbb") ?? UIImage())
        dateFormatter.dateStyle = .full
        hoursFormatter.dateFormat = "HH:mm"
        viewModel = ViewModel()
        viewModel?.getForecast(lattitude: 33.44, logitude: -94.04)
        viewModel?.bindingResultToHomeViewController =
        {
            DispatchQueue.main.async { [self] in
                self.forecast = self.viewModel?.forecastResult
                self.tempDegreeLabel.text = String(Int(round(self.forecast?.current?.temp ?? 0.0))).appending("°")
                self.tempDescriptionLabel.text = self.forecast?.current?.weather?[0].description
                self.feelsLikeLabel.text = "Feels Like: ".appending(String(Int(round(self.forecast?.current?.feels_like ?? 0.0)))).appending("°")
                self.cityLabel.text = self.forecast?.timezone
                self.date = Date(timeIntervalSince1970: self.forecast?.current?.dt ?? 0.0)
                self.dateLabel.text =  dateFormatter.string(from: (self.date ?? Date()))
                self.arr = forecast?.timezone?.components(separatedBy: "/")
                self.cityLabel.text = self.arr?[0]
            
                self.weatherIndicatorsTableView.reloadData()
                self.dailyForecastTableView.reloadData()
                self.hourlyForecastCollectionView.reloadData()
            }
        }
    }
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == dailyForecastTableView{
            return "10-DAY FORECAST"
        }
        else{
            return ""
        }
    }
}

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == dailyForecastTableView{
            return forecast?.daily?.count ?? 0
        }
        else{
           return 6
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == dailyForecastTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "dailyForecastCell", for: indexPath) as! DailyForecastTableViewCell
            self.days = Date(timeIntervalSince1970: Double(self.forecast?.daily?[indexPath.row].dt ?? 0))
            self.day = dateFormatter.string(from: (self.days ?? Date())).components(separatedBy: ",")
            cell.dayLabel.text = day?[0]
            cell.minTempLabel.text = String(Int(round(forecast?.daily?[indexPath.row].temp?.min ?? 0.0))).appending("°")
            cell.maxTempLabel.text = String(Int(round(forecast?.daily?[indexPath.row].temp?.max ?? 0.0))).appending("°")
            return cell
        }
        else{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! WeatherIndicatorsTableViewCell
            cell.createCell(rowIndex: indexPath.row)
            switch indexPath.row
            {
            case 0:
                cell.indicatorValueLabel.text = String(Int(forecast?.current?.uvi ?? 0))
            case 1:
                self.hours = Date(timeIntervalSince1970: Double(self.forecast?.current?.sunrise ?? 0))
                cell.indicatorValueLabel.text = hoursFormatter.string(from: (self.hours ?? Date()))
            case 2:
                self.hours = Date(timeIntervalSince1970: Double(self.forecast?.current?.sunset ?? 0))
                cell.indicatorValueLabel.text = hoursFormatter.string(from: (self.hours ?? Date()))
            case 3:
                cell.indicatorValueLabel.text = String(forecast?.current?.wind_speed ?? 0)
            case 4:
                cell.indicatorValueLabel.text = String(forecast?.current?.humidity ?? 0)
            case 5:
                cell.indicatorValueLabel.text = String(forecast?.current?.clouds ?? 0)
               
            default:
                break
            }
            return cell
        }
    }
}
extension HomeViewController: UICollectionViewDelegate{
    
}
extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast?.hourly?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! HourlyForecastCollectionViewCell
        self.hours = Date(timeIntervalSince1970: Double(self.forecast?.hourly?[indexPath.row].dt ?? 0) )
        cell.timeLabel.text =  hoursFormatter.string(from: (self.hours ?? Date()))
        cell.tempDegreeLabel.text = String(Int(round(forecast?.hourly?[indexPath.row].temp ?? 0.0))).appending("°")
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
