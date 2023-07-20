//
//  DeathView.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/29/22.
//

import SwiftUI

struct ObituaryView: View {
    
    @EnvironmentObject var person: Person
    @EnvironmentObject var AJ: Friend
    @EnvironmentObject var Andrew: Friend
    @EnvironmentObject var Audra: Friend
    @EnvironmentObject var Augie: Friend
    @EnvironmentObject var Bayley: Friend
    @EnvironmentObject var Gabe: Friend
    @EnvironmentObject var Jace: Friend
    @EnvironmentObject var Jared: Friend
    @EnvironmentObject var Jaden: Friend
    @EnvironmentObject var Jerika: Friend
    @EnvironmentObject var Luke: Friend
    @EnvironmentObject var Mason: Friend
    @EnvironmentObject var Nathan: Friend
    @EnvironmentObject var NexFlax: Friend
    @EnvironmentObject var Trevor: Friend
    @EnvironmentObject var Zach: Friend
    @EnvironmentObject var RyanFoley: Friend
    @Binding var lines: [(text: String, type: String)]
    @Binding var people: [Friend]
    @Binding var selectedIndex: Int
    
    @State var paddingAmount = 4.0
    

    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("Skull")
                    .resizable()
                    .padding(.vertical, paddingAmount)
                    .frame(width: 100.0, height: 105.0)
                Text("R.I.P. \(person.name)")
                    .padding(.vertical, paddingAmount)
                Text("\(person.age) years old")
                    .padding(.vertical, paddingAmount)
                Text("Died with $\(person.money)")
                    .padding(.vertical, paddingAmount)
                Text("They had sex a total of \(person.sexCount) times")
                    .padding(.vertical, paddingAmount)
                Spacer()
                Button(action: {
                    person.ressurect()
                    person.needsCreation = true
                    //people = [AJ, Andrew, Audra, Augie, Bayley, Gabe, Jace, Jared, Jaden, Jerika, Luke, Mason, Nathan, NexFlax, Trevor, Zach, RyanFoley]
                    selectedIndex = 0
                          lines = [(text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: "welcom!", type: "W"), ]
                }, label: {
                    Text("New Life")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(BlueButton())
                Spacer()
            }
        }
    }
}


//struct DeathView_P: PreviewProvider {
//
//    @State static var lines: [(text: String, type: String)] = [(text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: " ", type: "X"), (text: "welcom!", type: "W"), (text: "age increase line", type: "A"), (text: "random event line", type: "R"), (text: "really long line that takes up a lot of space and i need to figure otu how to wrap the text :)", type: "R") ]
//    @State static var selectedIndex = 0
//
//    static var previews: some View {
//        ObituaryView(lines: $lines, people: $people, selectedIndex: $selectedIndex)
//            .environmentObject(Person())
//    }
//}
