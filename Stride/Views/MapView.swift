//
//  MapView.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 02/08/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    //        @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    //    //
    //        @State var polyline = MKPolyline(coordinates: [CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),CLLocationCoordinate2D(latitude: -7.281584, longitude: 112.635996),CLLocationCoordinate2D(latitude: -7.286787, longitude: 112.635326)], count: 3)
    var mapList = Locations()
    @State var requestLocation = CLLocationCoordinate2D(latitude: 0, longitude:  0)
    @State var destinationLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @State var distances = 0.0
    @State var totalRoute = 0
    //        @State var selectedRoute = 1
    @Binding var selectedRoute: Int
    
    //    @State var animated = 0.0
    
    func updateRoute() {
        requestLocation = mapList.items[selectedRoute].startCoordinate
        destinationLocation = mapList.items[selectedRoute].finisCoordinate
//        print(requestLocation)
        distances = CLLocation(latitude: mapList.items[selectedRoute].finisCoordinate.latitude, longitude: mapList.items[selectedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: mapList.items[selectedRoute].startCoordinate.latitude, longitude: mapList.items[selectedRoute].startCoordinate.longitude))
    }
    
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            ZStack{
        //                Map(coordinateRegion: $mapRegion) { _ in
        //
        //                }
        ///ONLY MAP
        //            Map(coordinateRegion: $mapRegion)
        
        ///MAP WITH POINT
        //                            Map(coordinateRegion: $mapRegion, annotationItems: mapList.items) { location in
        //                                MapMarker(coordinate: location.startCoordinate)
        //                            }
        //
        ///MAP WITH CUSTOM POINT
        //                            Map(coordinateRegion: $mapRegion, annotationItems: mapList.items) { location in
        //                                MapAnnotation(coordinate: location.startCoordinate) {
        //                                    Circle()
        //                                        .stroke(.blue, lineWidth: 5)
        //                                        .frame(width: 44, height: 44)
        //                                }
        //                            }
        
        
        ///MAP WITH ROUTE
        //                VStack{
        MyMapView(requestLocation: $requestLocation,
                  //                                  requestLocation2:$requestLocation2,
                  destinationLocation: $destinationLocation
                  //                                  destination2: $destination2
        )
        .edgesIgnoringSafeArea(.all)
        //                }
        //                VStack{
        //                    Spacer()
        //                    Spacer()
        //
        //                    Spacer()
        //                }
        //                VStack{
        //                    Rectangle()
        //                        .fill(.gray)
        //                        .frame(height: 70)
        //                    Spacer()
        //                    Rectangle()
        //                        .fill(.gray)
        //                        .frame(height: 200)
        //                }
        
        
        //                Map(position: , ) {
        //                                Marker("San Francisco City Hall", coordinate: requestLocation)
        //                                    .tint(.orange)
        //                                Annotation("Diller Civic Center Playground", coordinate: destinationLocation) {
        //                                    ZStack {
        //                                        RoundedRectangle(cornerRadius: 5)
        //                                            .fill(Color.yellow)
        //                                        Text("🛝")
        //                                            .padding(5)
        //                                    }
        //                                }
        //                            }
        //                            .mapControlVisibility(.hidden)
        //                Text("halo \(distances) meters")
        //            }.ignoresSafeArea()
        .onAppear {
            totalRoute = mapList.items.count
            requestLocation = mapList.items[selectedRoute].startCoordinate
            destinationLocation = mapList.items[selectedRoute].finisCoordinate
//            print(requestLocation)
            distances = CLLocation(latitude: mapList.items[selectedRoute].finisCoordinate.latitude, longitude: mapList.items[selectedRoute].finisCoordinate.longitude).distance(from: CLLocation(latitude: mapList.items[selectedRoute].startCoordinate.latitude, longitude: mapList.items[selectedRoute].startCoordinate.longitude))

            updateRoute()
            //                print(distances)
        }
        .onChange(of: selectedRoute) { value in
//            print("masuk sini \(selectedRoute)")
            totalRoute = mapList.items.count
            updateRoute()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(selectedRoute: .constant(1))
    }
}
