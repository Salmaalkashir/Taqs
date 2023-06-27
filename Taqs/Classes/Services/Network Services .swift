//
//  Network Services .swift
//  Taqs
//
//  Created by Salma on 25/06/2023.
//

import Foundation

final class NetworkManager
{
    static func fetchData(lat: Double, lon: Double, completionHandler: @escaping(Forecast?)-> Void)
    {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=621a8559fe740d63c82df06faaea9c3c")
        guard let newUrl = url else{
            return completionHandler(nil)
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) {data, response, error in
            guard let newData = data else{
                return completionHandler(nil)
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try JSONDecoder().decode(Forecast.self, from: newData)
                completionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                print(String(describing: error))
                completionHandler(nil)
            }
        }
        task.resume()
        print("fitched")
    }
}
