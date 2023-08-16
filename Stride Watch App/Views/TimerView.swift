//
//  TimerView.swift
//  Stride Watch App
//
//  Created by Awang Syukriansah Dirgantoro on 14/08/23.
//

import SwiftUI

struct TimerView: View {
    
    @State var hour : Int = 0
    @State var minute : Int = 0
    @State var second : Int = 0
    @Binding var size : Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var isStart : Bool
    
    var body: some View {
//        VStack{
            HStack{
                if hour > 9 {
                    Text("\(hour)")
                        .italic()
                        .bold()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: CGFloat(size)))
                } else {
                    Text("0\(hour)")
                        .italic()
                        .bold()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: CGFloat(size)))
                }
                Text(":")
                    .bold()
                if minute > 9 {
                    Text("\(minute)")
                        .italic()
                        .bold()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: CGFloat(size)))
                } else {
                    Text("0\(minute)")
                        .italic()
                        .bold()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: CGFloat(size)))
                }
                Text(":")
                    .bold()
                if second > 9 {
                    Text("\(second)")
                        .italic()
                        .bold()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: CGFloat(size)))
                } else {
                    Text("0\(second)")
                        .italic()
                        .bold()
                        .foregroundColor(CustomColor.OrangeQurquma)
                        .font(.system(size: CGFloat(size)))
                }
            }
//            Text("Duration")
//                .foregroundColor(.gray)
//        }
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView( size: .constant(30),isStart: .constant(false))
    }
}
