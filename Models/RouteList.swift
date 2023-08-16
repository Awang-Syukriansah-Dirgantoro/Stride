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

struct checkPoint: Identifiable, Equatable {
    static func == (lhs: checkPoint, rhs: checkPoint) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let coordinate: CLLocationCoordinate2D
    let direction: String
}

class Locations: ObservableObject {
    @Published var items : [Location]
    
    init() {
        items = [
//            Location(id: 1, name: "Square Of UC", startCoordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602),checkPointCoordinate: [CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),CLLocationCoordinate2D(latitude: -7.281584, longitude: 112.635996),CLLocationCoordinate2D(latitude: -7.286787, longitude: 112.635326)], finisCoordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602)),
//            Location(id: 1, name: "Tower of London", startCoordinate: CLLocationCoordinate2D(latitude: 42.6619, longitude:  21.1501),checkPointCoordinate: [CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)],finisCoordinate: CLLocationCoordinate2D(latitude: 42.6919, longitude: 21.1701))
            Location(id: 0, name: "UC Kosko Sprint",
                     startCoordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602),
                     checkPointCoordinate: [
                        checkPoint(id: 0, coordinate: CLLocationCoordinate2D(latitude: -7.286233, longitude: 112.630602),direction: "Start") ,
                        checkPoint(id: 1, coordinate: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),direction: "Finish")],
                     finisCoordinate: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631)),
            Location(id: 1, name: "Baitulrozak Long Run",
                     startCoordinate: CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),
                     checkPointCoordinate: [
                        checkPoint(id: 0, coordinate:CLLocationCoordinate2D(latitude: -7.281262, longitude: 112.630631),direction: "Start"),
                        checkPoint(id: 1, coordinate: CLLocationCoordinate2D(latitude: -7.282521, longitude: 112.643846),direction: "Forward") ,
                        checkPoint(id: 2, coordinate:CLLocationCoordinate2D(latitude: -7.283990, longitude: 112.656763),direction: "Finish")],
                     finisCoordinate: CLLocationCoordinate2D(latitude: -7.283990, longitude: 112.656763)),
            Location(id: 2, name: "Kukuh Easy Run",
                     startCoordinate: CLLocationCoordinate2D(latitude: -7.285432, longitude: 112.6303367),
                     checkPointCoordinate: [
                        checkPoint(id: 0, coordinate:CLLocationCoordinate2D(latitude: -7.285432, longitude: 112.6303367),direction: "Start"),
                        checkPoint(id: 1, coordinate: CLLocationCoordinate2D(latitude: -7.281261, longitude: 112.630635),direction: "Right") ,
                        checkPoint(id: 2, coordinate: CLLocationCoordinate2D(latitude: -7.281723, longitude: 112.636007),direction: "U Turn") ,
                        checkPoint(id: 3, coordinate: CLLocationCoordinate2D(latitude: -7.281449, longitude: 112.630640),direction: "Left") ,
                        checkPoint(id: 4, coordinate: CLLocationCoordinate2D(latitude: -7.286297, longitude: 112.630660),direction: "Left") ,
                        checkPoint(id: 5, coordinate: CLLocationCoordinate2D(latitude: -7.286682, longitude: 112.635127),direction: "U Turn") ,
                        checkPoint(id: 6, coordinate: CLLocationCoordinate2D(latitude: -7.286853, longitude: 112.635111),direction: "U Turn") ,
                        checkPoint(id: 7, coordinate: CLLocationCoordinate2D(latitude: -7.285759, longitude: 112.625511),direction: "Right") ,
                        checkPoint(id: 8, coordinate: CLLocationCoordinate2D(latitude: -7.283752, longitude: 112.626987),direction: "Circle") ,
                        checkPoint(id: 9, coordinate: CLLocationCoordinate2D(latitude: -7.283741, longitude: 112.627008),direction: "Right") ,
                        checkPoint(id: 10, coordinate: CLLocationCoordinate2D(latitude: -7.283741, longitude: 112.627008),direction: "Forward") ,
                        checkPoint(id: 11, coordinate:CLLocationCoordinate2D(latitude: -7.285432, longitude: 112.6303367),direction: "Finish")],
                     finisCoordinate: CLLocationCoordinate2D(latitude: -7.285432, longitude: 112.6303367))
        ]
    }
}
