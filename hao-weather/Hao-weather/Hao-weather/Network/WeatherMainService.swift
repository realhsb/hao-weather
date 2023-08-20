//
//  WeatherMainService.swift
//  Hao-weather
//
//  Created by Subeen on 2023/08/19.
//

import Foundation
import Moya

enum WeatherMainService {
    case weather(lat: Double, lon: Double, appid: String, units: String, lang: String)  // 타입 중요 ,,,
    
}

extension WeatherMainService: TargetType {
    var baseURL: URL {
        return URL(string: WeatherAPI.baseUrl)!
    }
    
    var path: String {  // second url 붙이는 작업
        switch self {
        case .weather:
            return WeatherAPI.secondUrl
        }
    }
    
    var method: Moya.Method {   // get, push, delete ... 어떤 타입을 어떻게 가져올 것인지 정의
        switch self {
        case .weather:
            return .get
        }
    }
    
    var task: Moya.Task {   // parameter 또는 post body에 들어가는
        switch self {
        case .weather(let lat, let lon, let appid, let units, let lang):
            let parameters : [String : Any] = [
                "lat" : lat,
                "lon" : lon,
                "appid" : appid,
                "units" : units,
                "lang" : lang
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {   // header 설정
        switch self {
        case .weather:
            return [
                :
            ]
        }
    }
}

