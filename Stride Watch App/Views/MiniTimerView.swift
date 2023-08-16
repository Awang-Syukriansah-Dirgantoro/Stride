//
//  MiniTimerView.swift
//  Stride
//
//  Created by Awang Syukriansah Dirgantoro on 15/08/23.
//

import SwiftUI

struct MiniTimerView: View {
    
    @State var hour : Int = 0
    @State var minute : Int = 0
    @State var second : Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var isStart : Bool
    
    var body: some View {
        VStack{
            HStack{
                if hour > 9 {
                    Text("\(hour)")
                        .italic()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: 20))
                } else {
                    Text("0\(hour)")
                        .italic()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: 20))
                }
                Text(":")
                    .italic()
                if minute > 9 {
                    Text("\(minute)")
                        .italic()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: 20))
                } else {
                    Text("0\(minute)")
                        .italic()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: 20))
                }
                Text(":")
                    .italic()
                if second > 9 {
                    Text("\(second)")
                        .italic()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: 20))
                } else {
                    Text("0\(second)")
                        .italic()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: 20))
                }
            }
            Text("Time")
                .italic()
                .fontWeight(.bold)
        }
        .onReceive(timer) {_ in
            if isStart {
                if second + 1 == 60 {
                    if minute + 1 == 60 {
                        hour += 1
                        minute = 0
                    } else {
                        minute += 1
                    }
                    second = 0
                } else {
                    second += 1
                }
            }
        }
    }
}

struct MiniTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniTimerView(isStart: .constant(false))
    }
}
