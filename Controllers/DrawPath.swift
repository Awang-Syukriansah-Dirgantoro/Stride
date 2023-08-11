//
//  DrawPath.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 02/08/23.
//

import Foundation
import SwiftUI
import MapKit

struct MyMapView: UIViewRepresentable {
    @Binding var requestLocation: CLLocationCoordinate2D
    @Binding var destinationLocation: CLLocationCoordinate2D
    
    private let mapView = WrappableMapView()
    
    func makeUIView(context: UIViewRepresentableContext<MyMapView>) -> WrappableMapView {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        mapView.delegate = mapView
        return mapView
    }
    
    func updateUIView(_ uiView: WrappableMapView, context: UIViewRepresentableContext<MyMapView>) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
        let requestAnnotation = MKPointAnnotation()
        requestAnnotation.coordinate = requestLocation
        requestAnnotation.title = "Start"
        uiView.addAnnotation(requestAnnotation)
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destinationLocation
        destinationAnnotation.title = "Finish"
        uiView.addAnnotation(destinationAnnotation)
        
        let requestPlacemark = MKPlacemark(coordinate: requestLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: requestPlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { response, error in
            guard let response = response else { return }
            
            let route = response.routes[0]
            uiView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            let coba = route.polyline.coordinate
            print(coba)
            uiView.setRegion(MKCoordinateRegion(rect), animated: true)
            
            // if you want insets use this instead of setRegion
            uiView.setVisibleMapRect(rect, edgePadding: .init(top: 100.0, left: 50.0, bottom: 200.0, right: 50.0), animated: true)
            
        }
        
    }
    
    func setMapRegion(_ region: CLLocationCoordinate2D){
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        mapView.region = MKCoordinateRegion(center: region, latitudinalMeters: 0.007, longitudinalMeters: 0.007)
    }
    
    
}

class WrappableMapView: MKMapView, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        mapView.removeAnnotations(mapView.annotations)
//        mapView.removeOverlays(mapView.overlays)
        let renderer = MKPolylineRenderer(overlay: overlay)
//        renderer.strokeColor = getRandomColor()
        renderer.lineWidth = 4.0
        return renderer
    }
    
    
    
    func getRandomColor() -> UIColor{
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
}
