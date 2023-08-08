//
//  ContentView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedRoute = GlobalVariabels().chosedRoute
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        MapView()
//        MapView(selectedRoute: $selectedRoute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
