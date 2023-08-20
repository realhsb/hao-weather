//
//  Weather.swift
//  Hao-weather
//
//  Created by Subeen on 2023/08/19.
//

import Foundation

struct WeatherResponse: Codable { // Decode, Code
    let weather: [Weather]
    let main: Main?
}
//
//struct Main: Codable {
//    let temp: Double
//    let temp_min: Double
//    let temp_max: Double
//}
//
//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let description: String
//    let icon: String
//}



// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}


// MARK: - Weather
struct Weather: Codable {   // array
    let id: Int?           
    let main, description, icon: String?
}
