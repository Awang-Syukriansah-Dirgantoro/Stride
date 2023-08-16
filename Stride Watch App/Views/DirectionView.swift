//
//  DirectionView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 15/08/23.
//

import SwiftUI

struct DirectionView: View {
    @Binding var direction : String
    
    var body: some View {
        ZStack{
            if direction == "Forward" {
                
            }
            
            if direction == "Right" {
                
            }
            
            if direction == "Left" {
                
            }
            
            if direction == "U Turn" {
                
            }
            
            if direction == "Circle" {
                
            }
        }
    }
}

struct DirectionView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionView(direction: .constant("Forward"))
    }
}
