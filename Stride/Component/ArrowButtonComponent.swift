//
//  ChoseButtonComponent.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 05/08/23.
//

import SwiftUI

struct ArrowButtonComponent: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 125.51723, height: 129.99998)
            .background(
                Image("Arrow")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 125.5172348022461, height: 129.99998474121094)
                    .clipped()
//                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            )
    }
}

struct ArrowButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ArrowButtonComponent()
    }
}
