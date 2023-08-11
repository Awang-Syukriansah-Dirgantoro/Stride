//
//  ContentView.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 01/08/23.
//

import SwiftUI
import WatchConnectivity

//var selectedRoute = GlobalVariabels()

struct ContentView: View {
    var connectivity = WatchProvider()
    @StateObject var selectedRoute = GlobalVariabels()
//    @State var conectivity = WatchProvider.self
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        ZStack{
            MapView(selectedRoute: $selectedRoute.chosedRoute)
            VStack{
                ChoseButtonView(selectedRoute: $selectedRoute.chosedRoute)
                Button{
                    selectedRoute.isChosed = true
                    connectivity.send(variabel: [
                        "route": selectedRoute.chosedRoute,
                        "chosed": selectedRoute.isChosed,
                        "list": selectedRoute.routeCoordinate
                    ])
                } label: {
                    ArrowButtonComponent()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
