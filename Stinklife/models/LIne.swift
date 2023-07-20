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
        VStack {
            switch self.type {
                
            case "Cen": //centered, no icon
                Text(self.text)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, paddingAmount)
                
            case "N": //no icon
                HStack {
                    Text(self.text)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, paddingAmount)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
                
            case "Age": //Age
                VStack {
                    Divider()
                        .padding(.horizontal, paddingAmount * 2)
                    HStack {
                        Text(self.text)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, paddingAmount)
                            .font(.system(size: 20))
                            .bold()
                            //.foregroundColor(Color(red: 0.8, green: 0.53, blue: 0.00))
                            .fixedSize(horizontal: false, vertical: true)
                //Spacer()
//                        VStack(alignment: .center) {
//                            Image(systemName: "birthday.cake")
//                                .frame(width: iconWidth)
//                                .padding(.trailing, paddingAmount)
//                                .font(.system(size: 18))
//                        }
                    }
                }
                
            case "Rand": //Random Event
                HStack {
                    Text(self.text)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, paddingAmount)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
//                    VStack(alignment: .center) {
//                        Image(systemName: "dice")
//                            .frame(width: iconWidth)
//                            .padding(.trailing, paddingAmount)
//                            .font(.system(size: 18))
//                    }
                }
                
            case "Soc": //Social Event
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
                
            case "Ass": //Assault
                HStack {
                    Text(self.text)
                        .padding(.leading, paddingAmount)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    VStack(alignment: .center) {
                        Image("Stab")
                            .frame(width: iconWidth)
                            .padding(.trailing, paddingAmount)
                            .font(.system(size: 18))
                    }
                }
            case "Death":
                HStack {
                    Text(self.text)
                        .padding(.leading, paddingAmount)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    VStack(alignment: .center) {
                        Image("Skull")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, paddingAmount)
                            .font(.system(size: 18))
                    }

                }
                
            case "Jail":
                HStack {
                    Text(self.text)
                        .padding(.leading, paddingAmount)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    VStack(alignment: .center) {
                        Image("Stab")
                            .frame(width: iconWidth)
                            .padding(.trailing, paddingAmount)
                            .font(.system(size: 18))
                    }

                }
                
            default:
                HStack {
                    Text(self.text)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, paddingAmount)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
            }
            Text("")
        }

    }
}

struct Line_Previews: PreviewProvider {
    
    @State static var lines: [(text: String, type: String)] = [(text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: "welcom!", type: "W"), (text: "age increase line", type: "A"), (text: "random event line", type: "R"), (text: "You had a very nice conversation with NexFlax", type: "S") ]
    
    static var previews: some View {
        VStack {
            Line(text: "Centered Text (Cen)", type: "Cen")
            Line(text: "Age 69 (Age)", type: "Age")
            Line(text: "Random Events (Rand)", type: "Rand")
            Line(text: "Player interacts socially (Soc)", type: "Soc")
            Line(text: "Player has assaulted (Ass)", type: "Ass")
            Line(text: "Player has died (Death)", type: "Death")
            Line(text: "Player has been Jailed (Jail)", type: "Jail")
            Line(text: "No Icon (N)", type: "N")
            
        }
        .preferredColorScheme(.dark)

    }
    
    
}
