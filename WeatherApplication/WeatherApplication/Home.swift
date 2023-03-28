//
//  Home.swift
//  WeatherApplication
//
//  Created by Ranul Akmeemana on 2023-03-11.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Colombo").font(.title)
            
            Text(Date().formatted())
            
            Text("23.3 °C")
                .font(.system(size: 70))
                .bold()
            
            Text("few clouds")
                .font(.title)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
