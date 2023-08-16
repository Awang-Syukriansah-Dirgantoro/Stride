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
    @State var mapList = Locations()
    private let locationManagers = CLLocationManager()
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631), span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
    //    @State private var mapCamera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631), from: 7500, pitch: 0, heading: 90)
    @State var requestLocation = CLLocationCoordinate2D(latitude: 0, longitude:  0)
    @State var destinationLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @State var distances = 0.0
    @State var totalRoute = 0
    @Binding var checkPointNow : Int
    @Binding var selectedRoute: GlobalVariabels
    //    @State var listCheckpoint = Locations()
    var body: some View {
        ZStack{
            ///MAP WITH CUSTOM POINT
            Map(coordinateRegion: $mapRegion,showsUserLocation: true,
                userTrackingMode: .constant(.follow),annotationItems: mapList.items[selectedRoute.chosedRoute].checkPointCoordinate) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack{
                        if location.id > checkPointNow{
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 15, height: 10)
                        } else {
                            Circle()
                                .stroke(.green, lineWidth: 3)
                                .frame(width: 15, height: 10)
                        }
                        Text("\(location.direction)")
                    }
                }
            }
                .moveDisabled(false)
            //            Text("halo \(totalRoute) meters")
            //            VStack {
            //                Text("location status: \(locationManager.statusString)")
            //                HStack {
            //                    Text("latitude: \(userLatitude)")
            //                    Text("longitude: \(userLongitude)")
            //                }
            //            }
        }.ignoresSafeArea()
            .onAppear {
                totalRoute = mapList.items.count
                requestLocation = mapList.items[selectedRoute.chosedRoute].startCoordinate
                destinationLocation = mapList.items[selectedRoute.chosedRoute].finisCoordinate
                distances = CLLocation(latitude: mapList.items[selectedRoute.chosedRoute].finisCoordinate.latitude, longitude: mapList.items[selectedRoute.chosedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: mapList.items[selectedRoute.chosedRoute].startCoordinate.latitude, longitude: mapList.items[selectedRoute.chosedRoute].startCoordinate.longitude))
                //                print(distances)
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(checkPointNow: .constant(0), selectedRoute: .constant(GlobalVariabels()))
    }
}
