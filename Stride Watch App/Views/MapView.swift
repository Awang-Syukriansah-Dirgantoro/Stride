//
//  MapView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 02/08/23.
//

import SwiftUI
import MapKit
import CoreLocation
//import CoreLocationUI

struct MapView: View {
    var mapList = Locations()
    private let locationManagers = CLLocationManager()
    @StateObject var locationManager = LocationManager()
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State var requestLocation = CLLocationCoordinate2D(latitude: 0, longitude:  0)
    @State var destinationLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @State var distances = 0.0
    @State var totalRoute = 0
    @State var selectedRoute = 1
    
    var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
        }
        
        var userLongitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
    var body: some View {
        ZStack{
            ///ONLY MAP
//            Map(coordinateRegion: $mapRegion){
//                MapMarker(coordinate: requestLocation)
////                MapAnnotation(coordinate: requestLocation){
////
////                }
//            }
//
            ///MAP WITH POINT
//            Map(coordinateRegion: $mapRegion, annotationItems: mapList.items) { location in
////                if location.id == selectedRoute {
//                    MapMarker(coordinate: location.startCoordinate)
////                }
//                        }
//            Map(
//              coordinateRegion: $mapRegion,
//              showsUserLocation: true,
//              userTrackingMode: .constant(.follow)
//            )
//              .edgesIgnoringSafeArea(.all)
//              .onAppear {
//                  locationManagers.requestWhenInUseAuthorization()
//              }
            ///MAP WITH CUSTOM POINT
                        Map(coordinateRegion: $mapRegion,showsUserLocation: true,
                            userTrackingMode: .constant(.follow),annotationItems: mapList.items) { location in
                            MapAnnotation(coordinate: location.startCoordinate) {
                                Circle()
                                    .stroke(.red, lineWidth: 3)
                                    .frame(width: 15, height: 10)
                            }
                        }
            
            ///MAP WITH ROUTE
//            VStack{
//                Button("Pos"){
//                    print("Test")
//                    workoutManager.requestLocationAuthorization()
//                }
////                MyMapView(requestLocation: $requestLocation,
////                          //                                  requestLocation2:$requestLocation2,
////                          destinationLocation: $destinationLocation
////                          //                                  destination2: $destination2
////                )
//            }
//            Text("halo \(totalRoute) meters")
            VStack {
                        Text("location status: \(locationManager.statusString)")
                        HStack {
                            Text("latitude: \(userLatitude)")
                            Text("longitude: \(userLongitude)")
                        }
                    }
        }.ignoresSafeArea()
            .task {
                totalRoute = mapList.items.count
                requestLocation = mapList.items[selectedRoute].startCoordinate
                destinationLocation = mapList.items[selectedRoute].finisCoordinate
                distances = CLLocation(latitude: mapList.items[selectedRoute].finisCoordinate.latitude, longitude: mapList.items[selectedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: mapList.items[selectedRoute].startCoordinate.latitude, longitude: mapList.items[selectedRoute].startCoordinate.longitude))
                //                print(distances)
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
