//
//  shopView.swift
//  Stinklife
//
//  Created by Trevor Bollinger on 1/30/23.
//

import SwiftUI

struct jobView: View {
    
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
    //@Binding var people: [(name: String, gender: String, alive: String)]
    // @Binding var people: [Friend]
    @Binding var selectedIndex: Int
    @Binding var randomEventsList: [String]
    
    @State var garbagePay = 50
    @State var plumberPay = 150
    @State var mayorPay = 500
    
    @State var garbageAge = 16
    @State var plumberAge = 21
    @State var mayorAge = 25
    
    
    
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
                    //garbageman
                    HStack {
                        Button {
                            if person.jailed == false {
                                if(person.age >= garbageAge) {
                                    if(person.occupation != "Stinktown Garbageman"){
                                        if(person.occupation != ""){
                                            addLine(text: "I have abandoned my job as \(person.occupation)", type: "N")
                                        }
                                    }
                                    person.occupation = "Stinktown Garbageman"
                                    addLine(text: "I have accepted a job as a Stinktown Garbageman. My pay is $\(garbagePay) per year.", type: "N")
                                } else {
                                    addLine(text: "I need to be \(garbageAge) years old before I can become a Stinktown Garbageman!", type: "N")
                                }
                            } else {
                                addLine(text: "I can't get a job becuase I am in jail.", type: "N")
                            }
                            selectedIndex = 0
                        } label: {
                            Text("Stinktown Garbageman")
                        }
                        Spacer()
                        Text("$\(garbagePay) / year")
                            .bold()
                            .foregroundColor(Color(red: 0.0, green: 130/255, blue: 5/255))
                    }
                    
                    //Shit plumber
                    HStack {
                        Button {
                            if person.jailed == false {
                                if(person.age >= plumberAge) {
                                    if(person.occupation != "Shit Plumber"){
                                        if(person.occupation != ""){
                                            addLine(text: "I have abandoned my job as \(person.occupation)", type: "N")
                                        }
                                    }
                                    person.occupation = "Shit Plumber"
                                    addLine(text: "I have accepted a job as a Shit Plumber. My pay is $\(plumberPay) per year.", type: "N")
                                } else {
                                    addLine(text: "I need to be \(plumberAge) years old before I can become a Shit Plumber!", type: "N")
                                }
                            } else {
                                addLine(text: "I can't get a job becuase I am in jail.", type: "N")
                            }
                            selectedIndex = 0
                        } label: {
                            Text("Shit Plumber")
                        }
                        Spacer()
                        Text("$\(plumberPay) / year")
                            .bold()
                            .foregroundColor(Color(red: 0.0, green: 130/255, blue: 5/255))
                    }
                    
                    //Mayor of Stinktown
                    HStack {
                        Button {
                            if person.jailed == false {
                                if(person.age >= mayorAge) {
                                    if(person.occupation != "Mayor of Stinktown"){
                                        if(person.occupation != ""){
                                            addLine(text: "I have abandoned my job as \(person.occupation)", type: "N")
                                        }
                                    }
                                    person.occupation = "Mayor of Stinktown"
                                    addLine(text: "I have accepted a job as the Mayor of Stinktown! my pay is $\(mayorPay) per year.", type: "N")
                                } else {
                                    addLine(text: "I need to be \(mayorAge) years old before I can become the Mayor of Stinktown!", type: "N")
                                }
                            } else {
                                addLine(text: "I can't get a job becuase I am in jail.", type: "N")
                            }
                            selectedIndex = 0
                        } label: {
                            Text("Mayor of Stinktown")
                        }
                        Spacer()
                        Text("$\(mayorPay) / year")
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

struct jobView_Previews: PreviewProvider {
    
    @StateObject static var person = Person()
    
    @StateObject static var AJ = Friend(name: "AJ", gender: "M")
    @StateObject static var Andrew = Friend(name: "Andrew", gender: "M")
    @StateObject static var Audra = Friend(name: "Audra", gender: "F")
    @StateObject static var Augie = Friend(name: "Augie", gender: "M")
    @StateObject static var Bayley = Friend(name: "Bayley", gender: "M")
    @StateObject static var Gabe = Friend(name: "Gabe", gender: "M")
    @StateObject static var Jace = Friend(name: "Jace", gender: "M")
    @StateObject static var Jared = Friend(name: "Jared", gender: "M")
    @StateObject static var Jerika = Friend(name: "Jerika", gender: "F")
    @StateObject static var Luke = Friend(name: "Luke", gender: "M")
    @StateObject static var Mason = Friend(name: "Mason", gender: "M")
    @StateObject static var Nathan = Friend(name: "Nathan", gender: "F")
    @StateObject static var NexFlax = Friend(name: "NexFlax", gender: "M")
    @StateObject static var Trevor = Friend(name: "Trevor", gender: "M")
    
    @State static var randomEventsList = ["I got absolutely caca'd on!", "someone is dancing in the park!", "someone appreciated ur mom! xD haha", "I went to the craft fair! ;)", "the Eiffel tower has been relocated from Paris to Beijing again!", "I ripped my bong so hard I threw up! gnarly bro!", "someone fucked ur mom! xD haha"]
    
    
    @State static var selectedIndex = 0
    
    @State static var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
    
    
    static var previews: some View {
        jobView(lines: $lines, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList)
            .environmentObject(Person())
            .environmentObject(Friend(name: "aaassss", gender: "F"))
    }
}
