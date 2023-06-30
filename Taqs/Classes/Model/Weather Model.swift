//
//  Weather Model.swift
//  Taqs
//
//  Created by Salma on 25/06/2023.
//

import Foundation
import UIKit

struct Forecast: Decodable
{
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let timezone_offset: Int?
    let current: CurrentForecast?
    let hourly: [HourlyForecast]?
    let daily: [DailyForecast]?
}

struct CurrentForecast: Decodable
{
    let dt: Double?
    let sunrise: Int?
    let sunset:Int?
    let temp: Double?
    let feels_like: Double?
    let pressure: Int?
    let humidity: Int?
    //let dew_point: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let wind_speed: Double?
    let wind_deg: Int?
    let weather: [Weather]?
    
}

struct Weather: Decodable
{
    let id: Int?
    let main: Main?
    let description: String?//Description?
    let icon: String?
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

struct HourlyForecast: Decodable
{
    let dt: Int?
    let temp: Double?
    let feels_like: Double?
    let pressure: Int?
    let humidity: Int?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let wind_speed: Double?
    let wind_deg: Int?
   // let wind_gust: Double?
    let weather: [Weather]?
}

struct DailyForecast: Decodable
{
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let moonrise: Int?
    let moonset: Int?
    let moon_phase: Double?
    let temp: Temprature?
    let feels_like: FeelsLike?
    let pressure: Int?
    let humidity: Int?
    let wind_speed: Double?
    let wind_deg: Int?
    let weather: [Weather]?
    let clouds: Int?
    let rain: Double?
    let uvi: Double?
}

struct Temprature: Decodable
{
    let day: Double?
    let min: Double?
    let max: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
}

struct FeelsLike: Decodable
{
    let day: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
}


enum Indicators{
    case uvIndix
    case sunrise
    case sunset
    case wind
    case humidity
    case clouds
    
    var indicator : String{
        switch self{
        case .uvIndix:
            return "UV index"
        case .sunrise:
            return "Sunrise"
        case .sunset:
            return "Sunset"
        case .wind:
            return "Wind"
        case .humidity:
            return "Humidity"
        case .clouds:
            return "Clouds"
        }
    }
    
    var icon : UIImage{
        switch self{
        case .uvIndix:
            return UIImage(named: "uvIndex")!
        case .sunrise:
            return UIImage(named: "sunrise")!
        case .sunset:
            return UIImage(named: "sunset")!
        case .wind:
            return UIImage(named: "wind")!
        case .humidity:
            return UIImage(named: "humidity")!
        case .clouds:
            return UIImage(named: "clouds")!
        }
    }
}
