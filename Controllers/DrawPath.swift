//
//  DrawPath.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 02/08/23.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct MyMapView: UIViewRepresentable {
    @Binding var requestLocation: CLLocationCoordinate2D
    @Binding var destinationLocation: CLLocationCoordinate2D
//    @Binding var checkpoints: [checkPoint]
//    @State var annotationList: [MKAnnotation] = [MKAnnotation]()
    
    private let mapView = WrappableMapView()
    
    func makeUIView(context: UIViewRepresentableContext<MyMapView>) -> WrappableMapView {
//        mapView.removeAnnotations(mapView.annotations)
//        mapView.removeOverlays(mapView.overlays)
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
    
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        uiView.removeAnnotations(uiView.annotations)
//        uiView.removeOverlays(uiView.overlays)
//
//        var annotationList: [MKAnnotation] = [MKAnnotation]()
//        var route: (startPlacemark: MKPlacemark?, endPlacemark:MKPlacemark?)
//
//        let requestAnnotation = MKPointAnnotation()
//        requestAnnotation.coordinate = requestLocation
//        requestAnnotation.title = "Start"
//        uiView.addAnnotation(requestAnnotation)
//
//        let destinationAnnotation = MKPointAnnotation()
//        destinationAnnotation.coordinate = destinationLocation
//        destinationAnnotation.title = "Finish"
//        uiView.addAnnotation(destinationAnnotation)
//
//        let requestPlacemark = MKPlacemark(coordinate: requestLocation)
//        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)
//
//        let directionRequest = MKDirections.Request()
//        directionRequest.source = MKMapItem(placemark: requestPlacemark)
//        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
//        directionRequest.transportType = .automobile
//
//        let directions = MKDirections(request: directionRequest)
//        directions.calculate { response, error in
//            guard let response = response else { return }
//
//            let route = response.routes[0]
////            uiView.addOverlay(route.polyline, level: .aboveRoads)
//
//            let rect = route.polyline.boundingMapRect
//            let coba = route.polyline.coordinate
//            print(coba)
//            uiView.setRegion(MKCoordinateRegion(rect), animated: true)
//
//            // if you want insets use this instead of setRegion
//            uiView.setVisibleMapRect(rect, edgePadding: .init( top: 100.0, left: 50.0, bottom: 200.0, right: 50.0), animated: true)
//
//        }
//
//        for checkpoint in checkpoints {
//            annotationList.append(createAnnotation(with: checkpoint, addTo: uiView))
//
//            if route.startPlacemark == nil {
//                route.startPlacemark = MKPlacemark(coordinate: checkpoint.coordinate)
//            } else if route.endPlacemark == nil {
//                route.endPlacemark = MKPlacemark(coordinate: checkpoint.coordinate)
//            }
//
//            if let startPlacemark = route.startPlacemark, let endPlacemark = route.endPlacemark {
//                requestDirection(from: startPlacemark, to: endPlacemark, on: uiView)
////                let directionRequests = MKDirections.Request()
////                directionRequests.source = MKMapItem(placemark: startPlacemark)
////                directionRequests.destination = MKMapItem(placemark: endPlacemark)
////                directionRequests.transportType = .automobile
////
////                let directionss = MKDirections(request: directionRequests)
////                directionss.calculate { response, error in
////                    guard let response = response else { return }
////
////                    let route = response.routes[0]
////                    uiView.addOverlay(route.polyline, level: .aboveRoads)
////
////                    let rect = route.polyline.boundingMapRect
////                    let coba = route.polyline.coordinate
////                    print(coba)
//////                    uiView.setRegion(MKCoordinateRegion(rect), animated: true)
////
////                    // if you want insets use this instead of setRegion
//////                    uiView.setVisibleMapRect(rect, edgePadding: .init(top: 100.0, left: 50.0, bottom: 200.0, right: 50.0), animated: true)
////
////                }
//
//                route.startPlacemark = route.endPlacemark
//                route.endPlacemark = nil
//            }
//        }
//        uiView.showAnnotations(annotationList, animated: true)
//
//    }
    
//    private func createAnnotation(with checkpoint: checkPoint, addTo mapView: MKMapView) -> MKPointAnnotation{
//        let checkpointAnnotation = MKPointAnnotation()
//        checkpointAnnotation.coordinate = checkpoint.coordinate
//        if checkpoint.id == 0 {
//            checkpointAnnotation.title = "Start"
//        } else if checkpoint.id == checkpoints.count - 1 {
//            checkpointAnnotation.title = "Finish"
//        } else {
//            checkpointAnnotation.title = "Check Point"
//        }
////        checkpointAnnotation.title =
//        mapView.addAnnotation(checkpointAnnotation)
//        return checkpointAnnotation
//    }
//
//    private func requestDirection(from startPlacemark: MKPlacemark, to endPlacemark: MKPlacemark, on mapView: MKMapView) {
//        let directionReq = MKDirections.Request()
//        directionReq.source = MKMapItem(placemark: startPlacemark)
//        directionReq.destination = MKMapItem(placemark: endPlacemark)
//        directionReq.transportType = .walking
//
//        let direction = MKDirections(request: directionReq)
//        direction.calculate { response, error in
//            guard let response = response else { return }
//
//            let route = response.routes[0]
//            mapView.addOverlay(route.polyline, level: .aboveRoads)
//
////            for coordinate in route.polyline.coordinates {
////                print(createAnnotation(with: .init(name: "🏃🏻‍♂️",
////                                             coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude,
////                                                                                longitude: coordinate.longitude),
////                                             icon: "🏃🏻‍♀️"),
////                                 addTo: mapView))
////            }
////            let rect = route.polyline.boundingMapRect
////            mapView.setRegion(MKCoordinateRegion(rect), animated: true)
////
////            mapView.setVisibleMapRect(rect, edgePadding: .zero, animated: true)
//        }
//    }
//
//    func makeCoordinator() -> MapViewCoordinator {
//        return MapViewCoordinator()
//    }
//
//    class MapViewCoordinator: NSObject, MKMapViewDelegate {
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            let renderer = MKPolylineRenderer(overlay: overlay)
//            renderer.strokeColor = .purple
//            renderer.lineWidth = 5
//            return renderer
//        }
//
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            guard !(annotation is MKUserLocation) else {
//                return nil
//            }
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
//            if annotationView == nil {
//                annotationView = MKAnnotationView(annotation: annotation,
//                                                  reuseIdentifier: "custom")
//                annotationView?.canShowCallout = true
//            } else {
//                annotationView?.annotation = annotation
//            }
//            annotationView?.image = UIImage(systemName: "flag.checkered")
//            return annotationView
//        }
//    }
//
//    func setMapRegion(_ region: CLLocationCoordinate2D){
//        mapView.removeAnnotations(mapView.annotations)
//        mapView.removeOverlays(mapView.overlays)
//        mapView.region = MKCoordinateRegion(center: region, latitudinalMeters: 0.007, longitudinalMeters: 0.007)
//    }
    
    
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
