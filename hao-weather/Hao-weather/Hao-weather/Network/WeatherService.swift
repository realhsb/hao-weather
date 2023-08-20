//
//  WeatherService.swift
//  Hao-weather
//
//  Created by Subeen on 2023/08/19.
//

import Foundation

// 에러 정의
enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherService {
    // .plist에서 API Key 가져오기
    private var apiKey: String {
        get {
            // 생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: "KeyList", ofType: "plist") else {
                fatalError("Couldn't find file 'KeyList.plist'.")
            }
            
            // 경로를 URL로 변환하기
            let url = URL(filePath: filePath)
            
            // .plist를 딕셔너리로 받아오기
            let plist = try! NSDictionary(contentsOf: url, error: print("Couldn't find file 'KeyList.plist'."))
            
            // 딕셔너리에서 값 찾기
            guard let value = plist.object(forKey: "OPENWEATHERMAP_KEY") as? String else {
                fatalError("Couldn't find key 'OPENWEATHERMAP_KEY' in 'KeyList.plist'.")
            }
            
            return value
        }
    }
}
