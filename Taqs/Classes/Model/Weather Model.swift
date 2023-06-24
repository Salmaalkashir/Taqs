//
//  Weather Model.swift
//  Taqs
//
//  Created by Salma on 25/06/2023.
//

import Foundation

struct Forecast: Decodable
{
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: CurrentForecast?
    let hourly: [HourlyForecast]?
    let daily: [DailyForecast]?
}

struct CurrentForecast: Decodable
{
    let dt: Int?
    let sunrise: Int?
    let sunset:Int?
    let temp: Double?
    let feelsLike: Double?
    let pressure: Int?
    let humidity: Int?
    //let dew_point: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    
}

struct Weather: Decodable
{
    let id: Int?
    let main: Main?
    let description: Description?
    let icon: String?
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
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
    let temp: Int?
    let feelsLike: Double?
    let pressure: Int?
    let humidity: Int?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
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
    let moonPhase: Double?
    let temp: Temprature?
    let feelsLike: FeelsLike?
    let pressure: Int?
    let humidity: Int?
    let windSpeed: Double?
    let windDeg: Int?
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
