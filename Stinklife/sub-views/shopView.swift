//
//  shopView.swift
//  Stinklife
//
//  Created by Trevor Bollinger on 1/30/23.
//

import SwiftUI

struct shopView: View {
    
    @EnvironmentObject var person: Person

    
    @Binding var lines: [(text: String, type: String)]
    //@Binding var people: [(name: String, gender: String, alive: String)]
   // @Binding var people: [Friend]
    @Binding var selectedIndex: Int
    @Binding var randomEventsList: [String]
    
    @State var knifePrice = 300
    @State var gunPrice = 690
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack{ //HEADER
                    Text("Wallet:")
                    Text("$\(person.money)")
                        .bold()
                        .foregroundColor(Color(red: 0.0, green: 130/255, blue: 5/255))
                }
                
                List {
                    
                    //gun
                    HStack {
                        Button {
                            if person.money >= knifePrice {
                                person.money -= knifePrice
                                person.items.append("knife")
                                addLine(text: "I have purchased a knife for $\(knifePrice)!", type: "N")
                                selectedIndex = 0
                            } else {
                                addLine(text: "I can't afford to buy a knife!", type: "N")
                                selectedIndex = 0
                            }
                        } label: {
                            Text("Purchase Knife")
                        }
                        Spacer()
                        Text("$\(knifePrice)")
                            .bold()
                            .foregroundColor(Color(red: 0.0, green: 130/255, blue: 5/255))
                    }
                    
                    //knife
                    HStack {
                        Button {
                            if person.money >= gunPrice {
                                person.money -= gunPrice
                                person.items.append("gun")
                                addLine(text: "I have purchased a gun for $\(gunPrice)!", type: "N")
                                selectedIndex = 0
                            } else {
                                addLine(text: "I can't afford to buy a gun!", type: "N")
                                selectedIndex = 0
                            }
                        } label: {
                            Text("Purchase Gun")
                        }
                        Spacer()
                        Text("$\(gunPrice)")
                            .bold()
                            .foregroundColor(Color(red: 0.0, green: 130/255, blue: 5/255))
                    }
                }
            }
            //NavigationView Modifiers
            .navigationTitle(person.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    
                }
            }
        }
    }
    func checkForItem(target: String, person: Person) -> Bool {
        for items in person.items {
            if items == target {
                return true
            }
        }
        return false
    }
    
    func randomEvent() -> String {
        return randomEventsList[Int.random(in: 0..<randomEventsList.count)]
    }
    
//    func randomBodyPart() -> String {
//        return bodyPartsList[Int.random(in: 0..<bodyPartsList.count)] }
//
//    func randomAssaultAction() -> String {
//        return assaultActionList[Int.random(in: 0..<assaultActionList.count)] }
    
//    func randomCountry() -> String {
//        return countries[Int.random(in: 0..<countries.count)] }
    
//    func randomPerson() -> Friend {
//        return people[Int.random(in: 0..<people.count)] }
    
    func addLine(text: String, type: String) -> Void {
        lines.append((text: text, type: type))
    }
    
    func jailPlayer(victim: Friend) -> Void {
        addLine(text: "I have become arrested for the murder of \(victim.name)", type: "Jail")
        person.jailed = true
        person.money = 0
        person.items = [""]
    }
}

struct shopView_Previews: PreviewProvider {
    
    @StateObject static var person = Person()

    @State static var randomEventsList = ["I got absolutely caca'd on!", "someone is dancing in the park!", "someone appreciated ur mom! xD haha", "I went to the craft fair! ;)", "the Eiffel tower has been relocated from Paris to Beijing again!", "I ripped my bong so hard I threw up! gnarly bro!", "someone fucked ur mom! xD haha"]
    
    
    @State static var selectedIndex = 0
    
    @State static var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
    
    
    static var previews: some View {
        shopView(lines: $lines, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList)
            .environmentObject(Person())
            .environmentObject(Friend(name: "aaassss", gender: "F"))
    }
}
