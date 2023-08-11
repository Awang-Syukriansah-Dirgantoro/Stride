//
//  ContentView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var connectivity = Controller()
    @State var selectedRoute = Controller().globalVariabel.chosedRoute
    @StateObject var locationManager = LocationManager()
    var mapList = Locations()
    @State var meters = 10
    @State var coef = 500 / 111320.0
    @State var isStartWantToClick = true
    @State var distances = 0.0
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
            MapView(selectedRoute: $connectivity.globalVariabel).onAppear{
                print(connectivity.globalVariabel.isChosed)
            }
//            Text()
            if Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))) < meters {
//                print("nyampe start")
                if connectivity.globalVariabel.isChosed && isStartWantToClick {
                    Image("Background")
                        .scaledToFit()
                        .ignoresSafeArea(.all)
                    Button{
                        isStartWantToClick = false
                    } label: {
                        StartButtonComponent()
                    }
                }
            }
//                        VStack {
//                            Text("location status: \(coef)")
//                            HStack {
//                                Text("latitude: \(userLatitude)")
//                                Text("longitude: \(userLongitude)")
//                            }
//                        }
            Text("Ini Route \(Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))))")
        }
        .onAppear {
            distances = CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))
        }
//        MapView(selectedRoute: $selectedRoute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
