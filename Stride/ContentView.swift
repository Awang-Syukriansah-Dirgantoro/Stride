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
            VStack{
                ZStack(alignment: .bottom){
                    MapView(selectedRoute: $selectedRoute.chosedRoute)
                    ChoseButtonView(selectedRoute: $selectedRoute.chosedRoute)
                }
                ZStack(alignment: .top){
                    Image("Background")
                        .resizable()
                        .frame(height: 200)
                        .scaledToFill()
                        .ignoresSafeArea(.all)
                    VStack{
                        Button{
                            selectedRoute.isChosed = true
                            connectivity.send(variabel: [
                                "route": selectedRoute.chosedRoute,
                                "chosed": selectedRoute.isChosed,
                                "list": selectedRoute.routeCoordinate
                            ])
                        } label: {
                            Rectangle()
                                .frame(width: 200, height: 50)
                                .overlay{
                                    Text("Chosed")
                                }
                        }
                    }.padding()
                }
//                .frame(height: 200)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
