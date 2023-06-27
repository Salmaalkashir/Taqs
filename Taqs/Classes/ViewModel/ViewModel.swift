//
//  ViewModel.swift
//  Taqs
//
//  Created by Fatma on 27/06/2023.
//

import Foundation

class ViewModel
{
    var bindingResultToHomeViewController : (()->()) = {}
    var forecastResult : Forecast!
    {
        didSet{
            bindingResultToHomeViewController()
        }
    }
    
    func getForecast(lattitude: Double, logitude: Double)
    {
        NetworkManager.fetchData(lat: lattitude, lon: logitude) { result in
            self.forecastResult = result
        }
    }
}
