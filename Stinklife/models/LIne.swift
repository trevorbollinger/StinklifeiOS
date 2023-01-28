//
//  Line.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/27/22.
//

import SwiftUI

struct Line: View {
    
    @State var text: String
    @State var type: String
    
    @State var paddingAmount = 20.0
    @State var iconWidth = 32.0
    
    var body: some View {
        switch self.type {
            
        case "W": //Welcome Message
            Text(self.text)
                .padding(.horizontal, paddingAmount)
                .font(.system(size: 18))
            
        case "A": //Age
            VStack {
                Divider()
                    .padding(.horizontal, paddingAmount * 2)
                HStack {
                    Text(self.text)
                        .padding(.horizontal, paddingAmount)
                        .font(.system(size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    VStack(alignment: .center) {
                        Image(systemName: "birthday.cake")
                            .frame(width: iconWidth)
                            .padding(.trailing, paddingAmount)
                            .font(.system(size: 18))
                    }
                }
            }
            
        case "R": //Random Event
            HStack {
                Text(self.text)
                    .padding(.leading, paddingAmount)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "dice")
                        .frame(width: iconWidth)
                        .padding(.trailing, paddingAmount)
                        .font(.system(size: 18))
                }
            }
            
        case "S": //Social Event
            HStack {
                Text(self.text)
                    .padding(.leading, paddingAmount)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "person.3")
                        .frame(width: iconWidth)
                        .padding(.trailing, paddingAmount)
                        .font(.system(size: 18))
                }
            }
            
        default:
            Spacer()
        }
    }
}

struct Line_Previews: PreviewProvider {
    
    @State static var lines: [(text: String, type: String)] = [(text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: "welcom!", type: "W"), (text: "age increase line", type: "A"), (text: "random event line", type: "R"), (text: "You had a very nice conversation with NexFlax", type: "S") ]
    
    static var previews: some View {
        VStack {
            ForEach(0..<lines.count, id: \.self) { i in
                
                Color("MainColor")
                Line(text: lines[i].text, type: lines[i].type)
                
                
                
            }
        }
    }
    
    
}
