//
//  StartButtonComponent.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 08/08/23.
//

import SwiftUI

struct StartButtonComponent: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Circle()
            .foregroundColor(.clear)
//            .frame(width: 160, height: 160)
            .background(
                ZStack{
                    Circle()
                        .foregroundColor(.black)
//                        .frame(width: 160, height: 160)
                    Circle()
                        .stroke(.black, lineWidth: 7)
//                        .frame(width: 160, height: 160)
                    Image(systemName: "play.circle.fill")
                        .resizable()
//                        .frame(width: 160, height: 160)
                        .foregroundColor(CustomColor.OrangeQurquma)
                }
//                Image("Arrow")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 125.5172348022461, height: 129.99998474121094)
//                    .clipped()
//                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            )
    }
}

struct StartButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonComponent()
    }
}
