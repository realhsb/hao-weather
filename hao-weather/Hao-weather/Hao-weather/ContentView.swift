//
//  ContentView.swift
//  Hao-weather
//
//  Created by Subeen on 2023/08/19.
//

import SwiftUI

struct ContentView: View {
    
    // to call ViewModel
    
    // 1. state object (!!!!)
    // 2. Environment Object
    // 3. Obserable Object (!!!!)
//    @StateObject var viewModel: WeatherViewModel = WeatherViewModel()
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            Text("현재 서울 날씨는 \(viewModel.weatherModel?.weather.first?.description ?? "None")")
            
            
                
            
        }
        // onAppear vs task
        // 1. onAppear : 
        // 2. task : 비동기
        .task {
            viewModel.weatherResponse()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        @StateObject var viewModel: WeatherViewModel = WeatherViewModel()
        ContentView()
            .environmentObject(WeatherViewModel())
    }
}


//  배열이 하나라 first로 접근, 배열이 여러 개일 경우 foreach로 전체 돌 거나, .filter 사용
//            "weather": [
//                   {
//                       "id": 800,
//                       "main": "Clear",
//                       "description": "맑음",
//                       "icon": "01d"
//                   }
//               ]
