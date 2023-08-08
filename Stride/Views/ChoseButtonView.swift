//
//  ChoseButtonView.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 05/08/23.
//

import SwiftUI

struct ChoseButtonView: View {
    var mapList = Locations()
//    @StateObject var selectedRoute = GlobalVariabels()
    @Binding var selectedRoute: Int
    @State var animated = 0.0
    @State var totalRoute = 0
    @State var name = ""
    var body: some View {
        HStack{
            Button{
                if selectedRoute - 1 == -1 {
                    selectedRoute = totalRoute - 1
                } else {
                    selectedRoute -= 1
                }
                name = mapList.items[selectedRoute].name
                print("masuk sini \(selectedRoute)")
            } label: {
                ChoseButtonComponent()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -animated)
            }
            Spacer()
            Text(name)
            Spacer()
            Button{
                if selectedRoute + 1 == totalRoute {
                    selectedRoute = 0
                } else {
                    selectedRoute += 1
                }
                name = mapList.items[selectedRoute].name
            } label: {
                ChoseButtonComponent()
                    .offset(x: animated)
            }
        }.task {
            withAnimation (Animation.easeInOut (duration: 1).repeatForever()){
                animated += 12
            }
            name = mapList.items[selectedRoute].name
            totalRoute = mapList.items.count
        }
    }
}

struct ChoseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ChoseButtonView(selectedRoute: .constant(0))
    }
}
