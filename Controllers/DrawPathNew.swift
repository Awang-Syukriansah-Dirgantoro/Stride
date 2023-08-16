//
//  DrawPathNew.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 13/08/23.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct MapWithRouteView: UIViewRepresentable {
    @Binding var checkpoints: [checkPoint]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        // UC Loop -7.2856541,112.6281653
        let region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: -7.2856541, longitude: 112.6281653),
          span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(region, animated: true)
        
        var route: (startPlacemark: MKPlacemark?, endPlacemark:MKPlacemark?)
        var annotations: [MKPointAnnotation] =  [MKPointAnnotation]()
        
        for checkpoint in checkpoints {
            let coordinate = checkpoint.coordinate
            
            annotations.append(createAnnotation(with: checkpoint, addTo: mapView))
            
            if route.startPlacemark == nil {
                route.startPlacemark = MKPlacemark(coordinate: coordinate)
            } else if route.endPlacemark == nil {
                route.endPlacemark = MKPlacemark(coordinate: coordinate)
            }
            
            print(route)
            if let startPlacemark = route.startPlacemark, let endPlacemark = route.endPlacemark {
                requestDirection(from: startPlacemark, to: endPlacemark, on: mapView)
                
                route.startPlacemark = route.endPlacemark
                route.endPlacemark = nil
            }
            
//            if checkpoint == checkpoints.last, let firstCheckPoint = checkpoints.first{
//                requestDirection(from: MKPlacemark(coordinate: checkpoint.coordinate),
//                                 to: MKPlacemark(coordinate: firstCheckPoint.coordinate), on: mapView)
//            }
        }
        mapView.showAnnotations(annotations, animated: true)
    }
    
    private func createAnnotation(with checkpoint: checkPoint, addTo mapView: MKMapView) -> MKPointAnnotation{
        let pointAnnot = MKPointAnnotation()
        pointAnnot.coordinate = checkpoint.coordinate
        pointAnnot.title = checkpoint.direction
        mapView.addAnnotation(pointAnnot)
        
        return pointAnnot
    }
    
    private func requestDirection(from startPlacemark: MKPlacemark, to endPlacemark: MKPlacemark, on mapView: MKMapView) {
        let directionReq = MKDirections.Request()
        directionReq.source = MKMapItem(placemark: startPlacemark)
        directionReq.destination = MKMapItem(placemark: endPlacemark)
        directionReq.transportType = .automobile
        
        let direction = MKDirections(request: directionReq)
        direction.calculate { response, error in
            guard let response = response else { return }
            
            let route = response.routes[0]
            mapView.addOverlay(route.polyline, level: .aboveRoads)
            
//            for coordinate in route.polyline.coordinates {
//                print(createAnnotation(with: .init(name: "oke",
//                                             coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude,
//                                                                                longitude: coordinate.longitude),
//                                             icon: "oke"),
//                                 addTo: mapView))
//            }
//            let rect = route.polyline.boundingMapRect
//            mapView.setRegion(MKCoordinateRegion(rect), animated: true)
//
//            mapView.setVisibleMapRect(rect, edgePadding: .zero, animated: true)
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemIndigo
            renderer.lineWidth = 5
            return renderer
        }
        
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
    }
}

extension MKMultiPoint {
    var coordinates: [CLLocationCoordinate2D] {
        var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid,
                                              count: pointCount)

        getCoordinates(&coords, range: NSRange(location: 0, length: pointCount))

        return coords
    }
}

// Given a MKRoute, you can just do:
// route.polyline.coordinates
