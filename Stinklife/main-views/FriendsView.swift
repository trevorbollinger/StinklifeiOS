//
//  FriendsView.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/30/22.
//

import SwiftUI

struct FriendsView: View {
    
    @EnvironmentObject var person: Person
    @Binding var lines: [(text: String, type: String)]
    @Binding var people: [(name: String, gender: String, alive: String)]
    @Binding var selectedIndex: Int
    @Binding var randomLinesPositive: [String]
    @Binding var randomLinesNegative: [String]
    @Binding var bodyPartsList: [String]
    @Binding var assaultActionList: [String]
    
    @State var showChatMenu = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<self.people.count, id: \.self) { i in
                        if people[i].alive == "true" {
                            Menu {
                                
                                // CHAT WITH
                                Button(action: {
                                    switch Int.random(in: 0...100) {
                                    case 0...25:
                                        lines.append(("I said hello to \(people[i].name), and they said hello back.", type: "S"))
                                    case 26...50:
                                        lines.append(("I tried to say hello to \(people[i].name), but they were wearing airpods and didn't hear me.", type: "S"))
                                    case 51...75:
                                        lines.append(("I said hello to \(people[i].name), and they told me to suck a cucumber", type: "S"))
                                    case 76...90:
                                        lines.append(("I decided not to say hello to \(people[i].name) because I remembered that I am very stinky today", type: "S"))
                                    case 91...100:
                                        lines.append(("I said hello to \(people[i].name), and they immediately had a very good time.", type: "S"))
                                    default: break
                                    }
                                    self.selectedIndex = 0
                                }) {
                                    Label("Chat With", systemImage: "figure.socialdance")
                                }

                                
                                // SEX WITH
                                Button(action: {
                                    self.selectedIndex = 0
                                    if randomChance(probability: 50) {
                                        lines.append(("I gamed the absolute crud out of \(people[i].name)", type: "S"))
                                        person.sexCount += 1
                                    } else {
                                        lines.append(("I tried to game with \(people[i].name), but my gamer fingers slipped!", type: "S"))
                                    }
                                }) {
                                    Label("Game With", systemImage: "figure.socialdance")
                                }
                                
                                // ASSAULT
                                Button(action: {
                                    self.selectedIndex = 0
                                    if randomChance(probability: 65) {
                                        for _ in 0..<Int.random(in: 1...6) {
                                            lines.append(("I \(assaultActionList[Int.random(in: 0..<assaultActionList.count)]) \(people[i].name)'s \(bodyPartsList[Int.random(in: 0..<bodyPartsList.count)])", type: "S"))
                                        }
                                        if randomChance(probability: 40) {
                                            lines.append((text:"\(people[i].name) has died from their injuries", type: "S"))
                                            people[i].alive = "false"
                                        } else {
                                            lines.append((text:"\(people[i].name) has survived their injuries", type: "S"))
                                        }
                                    } else if randomChance(probability: 3) {
                                        lines.append(("I made \(people[i].name) listen to weezer!", type: "S"))

                                    } else {
                                        lines.append(("I attempted to assault \(people[i].name)'s \(bodyPartsList[Int.random(in: 0..<bodyPartsList.count)]), but I missed!", type: "S"))
                                    }
                                }) {
                                    Label("Assault", systemImage: "person.2.slash")
                                }
                                
                            // UP/DOWN CHEVRON
                            } label: {
                                HStack {
                                    Text("\(people[i].name)")
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Image(systemName: "chevron.up.chevron.down")
                                }
                                .contentShape(Rectangle())
                            }

                        }
                    }
                }
                .foregroundColor(Color("AccentColor"))
            }
            
            //NavigationView Modifiers
            .navigationTitle(person.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    
                }
            }

            
            //CHAT MENU

            
            
        }
    }
}

//struct FriendsView_Previews: PreviewProvider {
//     
//    @State static var selectedIndex = 0
//    
//    @State static var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
//    
//    @State static var people: [(name: String, gender: String, alive: Bool)] =
//    [(name: "AJ", gender: "M", alive: true),
//     (name: "Andrew", gender: "M", alive: true),
//     (name: "Audra", gender: "F", alive: true),
//     (name: "Augie", gender: "M", alive: true),
//     (name: "Bayley", gender: "M", alive: true),
//     (name: "Gabe", gender: "M", alive: true),
//     (name: "Jace", gender: "M", alive: true),
//     (name: "Jared", gender: "M", alive: true),
//     (name: "Jerika", gender: "F", alive: true),
//     (name: "Luke", gender: "M", alive: true),
//     (name: "Mason", gender: "M", alive: true),
//     (name: "Nathan", gender: "M", alive: true),
//     (name: "NexFlax", gender: "M", alive: true),
//     (name: "Trevor", gender: "M", alive: true)]
//    
//    @State static var randomLinesPositive = ["I got absolutely fucked!", "someone shit in the park!", "fuck! my dog died!", "someone bombed my house!", "somsone fucked ur mom! xD lmao", "I went to the strip club! ;)", "the eiffel tower has been relocated from Paris to Beijing!", "I ripped your bong so hard you threw up! gnarly bro!", "a stranger has broken into my house and fucked my dog! not again!"]
//    
//    @State static var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx"]
//    
//    @State static var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "anhilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "passionately licked", "took out a gun and shot", "bombed", "painted"]
//    
//    @State  static var randomLinesNegative = ["your penis exploded"]
//    
//    static var previews: some View {
//        FriendsView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
//            .environmentObject(Person())
//    }
//}
