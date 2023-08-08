//
//  RouteList.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 02/08/23.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id: Int
    let name: String
    let startCoordinate: CLLocationCoordinate2D
    let checkPointCoordinate: [checkPoint]
    let finisCoordinate: CLLocationCoordinate2D
}

struct checkPoint: Identifiable {
    let id: Int
    let coordinate: CLLocationCoordinate2D
}

class Locations: ObservableObject {
    @Published var items = [Location]()
    
    init() {
        items = [
//            Location(id: 1, name: "Square Of UC", startCoordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602),checkPointCoordinate: [CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),CLLocationCoordinate2D(latitude: -7.281584, longitude: 112.635996),CLLocationCoordinate2D(latitude: -7.286787, longitude: 112.635326)], finisCoordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602)),
//            Location(id: 1, name: "Tower of London", startCoordinate: CLLocationCoordinate2D(latitude: 42.6619, longitude:  21.1501),checkPointCoordinate: [CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)],finisCoordinate: CLLocationCoordinate2D(latitude: 42.6919, longitude: 21.1701))
            Location(id: 0, name: "UC Kosko Sprint", startCoordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602),checkPointCoordinate: [checkPoint(id: 0, coordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602)) ,checkPoint(id: 0, coordinate: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631))], finisCoordinate: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631)),
            Location(id: 1, name: "Baitulrozak Long Run", startCoordinate: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),checkPointCoordinate: [checkPoint(id: 0, coordinate:CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631)),checkPoint(id: 0, coordinate:CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631))], finisCoordinate: CLLocationCoordinate2D(latitude: -7.283990, longitude: 112.656763))
        ]
    }
}
