//
//  ContentView.swift
//  WeatherApp
//
//  Created by Saif Siddiqui on 31/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Jaipur, India")
                    .font(
                        .system(size: 32,weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
//                    .frame(width:200, height: 200)
//                    .background(Color.red )
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
