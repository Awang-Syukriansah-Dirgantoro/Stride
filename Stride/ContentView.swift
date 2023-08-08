//
//  ContentView.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 01/08/23.
//

import SwiftUI

//var selectedRoute = GlobalVariabels()

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
        ZStack{
            MapView(selectedRoute: $selectedRoute)
            ChoseButtonView(selectedRoute: $selectedRoute)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
