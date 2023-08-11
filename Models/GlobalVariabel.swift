//
//  GlobalVariabel.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 05/08/23.
//

import Foundation
import MapKit

struct routePoint: Identifiable {
    let id: Int
    let coordinate: CLLocationCoordinate2D
//    let direction: String
}

class GlobalVariabels: ObservableObject {
    @Published var chosedRoute: Int = 0
    @Published var isChosed: Bool = false
    @Published var routeCoordinate = [routePoint]()
}
