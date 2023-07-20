//
//  PeopleView.swift
//  StinkLife
//
//  Created by Trevor Bollinger on 12/19/22.
//

import SwiftUI

struct PeopleView: View {
    
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
    @Binding var people: [Friend]
    @Binding var selectedIndex: Int
    @Binding var randomEventsList: [String]
    @Binding var bodyPartsList: [String]
    @Binding var assaultActionList: [String]
    
    @State var showConfirmSuicide = false
    @State var paddingAmount = 7.0
    @State var fac = 0.03
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: "https://thispersondoesnotexist.com/image")) { image in
                        image.resizable()
                    } placeholder: {
                        Image("FaceImg")
                            .resizable()
                    }
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                    
                    Text("\(person.name)")
                        .font(.system(size:40))
                        .bold()
                }
                .padding(.vertical, paddingAmount)
                
                VStack{
                    if person.spouse != "" {
                        Text("In a relationship with \(person.spouse)")
                            .padding(.bottom, 1)
                    }
                    
                    if person.jailed {
                        Text("(Jailed)")
                            .padding(.bottom,1)
                    }
                    if !person.alive {
                        Text("Dead!")
                            .padding(.bottom,1)
                    }

                    Text("Chance of Death: \(person.deathChance/100)")
                    Divider()
                        .padding(.horizontal)
                    
                }

                if person.occupation != "" {
                    HStack { //OCCUPATION
                        Image(systemName: "briefcase")
                        Text("Occupation: \(person.occupation)")
                            .font(.system(size:25))
                            .multilineTextAlignment(.center)
                            .bold()
                    
                    }
                    .padding(.bottom, 0.0001)
                }
                

                
                HStack { //INVENTORY
                    Image(systemName: "backpack.fill")
                    Text("Inventory")
                        .font(.system(size:25))
                        .bold()
                }
                .padding(.bottom, 2.0)

                
                HStack { //CONTENTS
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .padding(0.0)
                        Text("\(person.money)")
                            .padding(0.0)
                        if(checkForItem(target: "knife", person: person)) {
                            Image("Knife")
                                .padding(.horizontal, paddingAmount)
                        }
                        if(checkForItem(target: "gun", person: person)) {
                            Image("Gun")
                                .padding(.horizontal, paddingAmount)
                        }
                    }
                }
                
                List {
                    NavigationLink(destination: StatsView()) {
                        Text("Character Information")
                        
                    }
                    NavigationLink(destination:jobView(lines: $lines, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList)
                        .environmentObject(AJ)
                        .environmentObject(Audra)
                        .environmentObject(Augie)
                        .environmentObject(Bayley)
                        .environmentObject(Gabe)
                        .environmentObject(Jace)
                        .environmentObject(Jared)
                        .environmentObject(Jaden)
                        .environmentObject(Jerika)
                        .environmentObject(Luke)
                        .environmentObject(Mason)
                        .environmentObject(Nathan)
                        .environmentObject(NexFlax)
                        .environmentObject(Trevor)
                        .environmentObject(Zach)
                        .environmentObject(RyanFoley))
                    {
                        Text("Get a Job")
                    }
                    NavigationLink(destination:shopView(lines: $lines, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList)
                        .environmentObject(AJ)
                        .environmentObject(Audra)
                        .environmentObject(Augie)
                        .environmentObject(Bayley)
                        .environmentObject(Gabe)
                        .environmentObject(Jace)
                        .environmentObject(Jared)
                        .environmentObject(Jaden)
                        .environmentObject(Jerika)
                        .environmentObject(Luke)
                        .environmentObject(Mason)
                        .environmentObject(Nathan)
                        .environmentObject(NexFlax)
                        .environmentObject(Trevor)
                        .environmentObject(Zach)
                        .environmentObject(RyanFoley))
                    {
                        Text("Shop")
                    }
                    
                    if person.jailed {
                        Button {
                            selectedIndex = 0
                            addLine(text: "I started a prison riot", type: "Ass")
                            if randomChance(probability: 50) {
                                addLine(text: "I attacked another inmate in the prison riot", type: "N")
                                for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                    addLine(text: "I \(randomAssaultAction()) their \(randomBodyPart())", type: "N")
                                }
                            } else {
                                addLine(text: "I've been attacked in the prison riot", type: "N")
                                for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                    addLine(text: "My \(randomBodyPart()) was \(randomAssaultAction())", type: "N")
                                }
                                if randomChance(probability: 40) {
                                    death()
                                }
                            }
                        } label: {
                            Text("Start a Prison Riot")
                        }
                        
                    }
                    
                    Button {
                        showConfirmSuicide = true
                    } label: {
                        Text("Kill Yourself")
                    }
                    
                }
                .padding(.bottom, paddingAmount)
                
            }
            .padding(.top, paddingAmount)
            //Suicide Confirmation Button
            .alert("Kill Yourself?", isPresented: $showConfirmSuicide) {
                Button {
                    death()
                } label: {
                    Text("fuck yeah")
                }
                Button {
                    showConfirmSuicide = false
                } label: {
                    Text("nah")
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
    
    func randomPerson() -> Friend {
        return people[Int.random(in: 0..<people.count)] }
    
    func addLine(text: String, type: String) -> Void {
        lines.append((text: text, type: type))
    }
    func death() -> Void {
        addLine(text: "I have died.", type: "Death")
        person.dead = true
        person.alive = false
        selectedIndex = 0
    }
}

struct PeopleView_P: PreviewProvider {
    
    @State static var selectedIndex = 0
    
    @State static var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
    
    @State static var Audra = Friend(name: "Audra", gender: "F")
    @State static var people: [Friend] = [Audra]
    @StateObject static var person = Person()
    
    @State static var randomEventsList = ["I got absolutely fucked!", "someone shit in the park!", "fuck! my dog died!"]
    
    @State static var bodyPartsList = ["head", "shoulders", "knees"]
    
    @State static var assaultActionList = ["inverted", "creamed", "fucked"]
    
    
    static var previews: some View {
        PeopleView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
            .environmentObject(Person())
            .environmentObject(Audra)
    }
}
