//
//  ContentView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 01/08/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var connectivity = Controller()
    @State var selectedRoute = Controller().globalVariabel.chosedRoute
    @StateObject var locationManager = LocationManager()
    var mapList = Locations()
    @State var meters = 200
    @State var isStartWantToClick = true
    @State var distances = 0.0
    @State var checkPointNow = 0
    @State var sizeTimerSecondScreen = 30
    @State var sizeTimerFirstScreen = 20
    @State var isStart = false
//    @State var locationManagers = CLLocationManager()
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
            TabView{
                ZStack{
                    Image("Background")
                        .scaledToFit()
                        .ignoresSafeArea(.all)
                    Text("Ready to \nStride \n\(locationManager.speed ?? 0)").bold()
//                    Button{
//                        isStartWantToClick = false
//                        isStart = true
//                        //                            WKHapticType(rawValue: 0)
//                    } label: {
//                        StartButtonComponent()
//                            .onAppear{
//                                WKInterfaceDevice.current().play(WKHapticType(rawValue: 6)!)
//                            }
//                    }
                    if connectivity.globalVariabel.isChosed {
//                        MapView(checkPointNow: $checkPointNow, selectedRoute: $connectivity.globalVariabel).onAppear{
//                            print(connectivity.globalVariabel.isChosed)
//                        }
                        VStack{
                            ZStack(alignment: .topLeading){
                                MapView(checkPointNow: $checkPointNow, selectedRoute: $connectivity.globalVariabel).onAppear{
                                    print(connectivity.globalVariabel.isChosed)
                                }
                                Text("Speed \n\(locationManager.speed ?? 0)")
                                    .bold()
                                    .foregroundColor(CustomColor.OrangeQurquma)
                                    .padding()
                            }
                            ZStack(alignment: .top){
                                HStack{
                                    MiniHealthView()
                                    Spacer()
                                    Text("|")
                                        .font(.system(size: 20))
                                    Spacer()
    //                                MiniTimerView(isStart: $isStart)
                                    VStack {
                                        TimerView(size: $sizeTimerFirstScreen,isStart: $isStart)
                                        Text("Time")
                                            .italic()
                                            .fontWeight(.bold)
                                    }
    //                                    .frame()
                                }
                                .padding(.horizontal)
                                .padding(.bottom)
                            }
                        }
                        //            Text()
                        if Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].startCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].startCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))) < meters {
                            //                print("nyampe start")
                            if connectivity.globalVariabel.isChosed && isStartWantToClick {
                                Image("Background")
                                    .scaledToFit()
                                    .ignoresSafeArea(.all)
                                VStack{
                                    Button{
                                        isStartWantToClick = false
                                        isStart = true
                                        //                            WKHapticType(rawValue: 0)
                                    } label: {
                                        StartButtonComponent()
                                    }
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom)
                                    Text("Start Your Running")
                                        .italic()
                                }
                            }
                        }
                        
//                        if Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].coordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].coordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))) < meters {
//                            //                print("nyampe start")
//                            if mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].direction == "Forward" {
//
//                            }
//
//                            if mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].direction == "Right" {
//
//                            }
//
//                            if mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].direction == "Left" {
//
//                            }
//
//                            if mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].direction == "U Turn" {
//
//                            }
//
//                            if mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].direction == "Circle" {
//
//                            }
//                        }
                        //                        VStack {
                        //                            Text("location status: \(coef)")
                        //                            HStack {
                        //                                Text("latitude: \(userLatitude)")
                        //                                Text("longitude: \(userLongitude)")
                        //                            }
                        //                        }
                        Text("Ini Route \(Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].startCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].startCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0))))) \n ini meter \(meters) \n ini chose \(connectivity.globalVariabel.chosedRoute)")
                    }
                }
                ZStack{
                    Image("Background")
                        .scaledToFit()
                        .ignoresSafeArea(.all)
                    VStack{
//                        HealthView()
                        TimerView(size: $sizeTimerSecondScreen,isStart: $isStart)
                        Text("Duration")
                                        .foregroundColor(.gray)
                    }
                }
                ZStack{
                    Image("Background")
                        .scaledToFit()
                        .ignoresSafeArea(.all)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .onAppear {
//            locationManagers.requestWhenInUseAuthorization()
            WKInterfaceDevice.current().play(WKHapticType(rawValue: 0)!)
            distances = CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))
        }
        .onChange(of: locationManager.lastLocation){_ in
            
            if Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].startCoordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].startCoordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))) < meters {
                WKInterfaceDevice.current().play(WKHapticType(rawValue: 6)!)
                checkPointNow += 1
            }
            
//            if Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].coordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].coordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))) < meters {
//                WKInterfaceDevice.current().play(WKHapticType(rawValue: 3)!)
//            }
            
//            if Int(CLLocation(latitude: mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].coordinate.latitude, longitude: mapList.items[connectivity.globalVariabel.chosedRoute].checkPointCoordinate[checkPointNow + 1].coordinate.longitude).distance(from: CLLocation(latitude: (locationManager.lastLocation?.coordinate.latitude ?? 0), longitude: (locationManager.lastLocation?.coordinate.longitude ?? 0)))) < meters / 2 {
//                    checkPointNow += 1
//            }
        }
            
//        MapView(selectedRoute: $selectedRoute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
