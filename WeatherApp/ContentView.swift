//
//  ContentView.swift
//  WeatherApp
//
//  Created by Saif Siddiqui on 31/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Jaipur")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temprature: 72)
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temprature: 72)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.max.fill", temprature: 88)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind.snow", temprature: 55)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "sunset.fill", temprature: 60)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.fog.fill", temprature: 25)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                    print("tapped")
                }label: {
                    WeatherButton(title: "Change day time", textColor: .white, backgroundColor: .black)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek:String
    var imageName:String
    var temprature:Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temprature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
   var isNight : Bool
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ?.gray:.lightBlue]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
//        ContainerRelativeShape()
//            .fill(.black.gradient)
//            .ignoresSafeArea()
    }
}

struct CityTextView:View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(
                .system(size: 32,weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView : View{
    var imageName : String
    var temprature : Int
    var body : some View{ VStack(spacing:10){
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temprature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundStyle(.white)
    }
    .padding(.bottom, 40)
    }
}


