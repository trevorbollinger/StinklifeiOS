//
//  StatsView.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/29/22.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var person: Person
    
    @State var pd = 4.0
    @State var fontSize = 20.0
    @State var frameWidth = 30.0
    
    var body: some View {
        
        VStack {
            VStack() {
                
                
                HStack {
                    VStack(alignment: .center) {
                        Image(systemName: "pencil").font(.system(size: fontSize)).bold()
                    }
                    .frame(width: frameWidth)
                    Text("\(person.name)").font(.system(size:fontSize)).bold()
                    Spacer()
                    
                       
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, pd)
                
                HStack {
                    VStack(alignment: .center) {
                        Image(systemName: "birthday.cake").font(.system(size: fontSize)).bold()
                    }
                    .frame(width: frameWidth)
                    Text("\(person.age) years old").font(.system(size:fontSize)).bold()
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, pd)
                
                HStack {
                    VStack(alignment: .center) {
                        Image(systemName: "wallet.pass").font(.system(size: fontSize)).bold()
                    }
                    .frame(width: frameWidth)
                    Text("You have \(person.money) monies").font(.system(size:fontSize)).bold()
                    Spacer()
                }
                .padding(.all, pd)
                
                
            }
            .padding(.leading, 20.0)
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environmentObject(Person())
    }
}
