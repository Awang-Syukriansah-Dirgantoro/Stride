//
//  ContentView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var connectivity = Controller()
    @State var selectedRoute = GlobalVariabels().chosedRoute
    @StateObject var locationManager = LocationManager()
    @State var meters = 50
    
    // number of km per degree = ~111km (111.32 in google maps, but range varies
    // between 110.567km at the equator and 111.699km at the poles)
    //
    // 111.32km = 111320.0m (".0" is used to make sure the result of division is
    // double even if the "meters" variable can't be explicitly declared as double)
//    double coef = meters / 111320.0;
//
//    double new_lat = my_lat + coef;
//
//    // pi / 180 ~= 0.01745
//    double new_long = my_long + coef / Math.cos(my_lat * 0.01745);
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        ZStack{
            MapView().onAppear{
                print(selectedRoute)
            }
            Text("Ini Route \(connectivity.globalVariabel.chosedRoute)")
        }
//        MapView(selectedRoute: $selectedRoute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
