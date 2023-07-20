//
//  popUpView.swift
//  Stinklife
//
//  Created by Trevor Bollinger on 4/27/23.
//

import SwiftUI

struct popUpView: View {
    
    @State var prompt: String
    @State var acceptText: String
    @State var declineText: String
    @State var result = ""
    @State var playerIsAttacked: Bool
    @State var playerAttacks: Bool
    @State var jailMsg: String
    @State var deathMsg: String
    @Binding var popUpEvent: Bool
    @Binding var lines: [(text: String, type: String)]
    @EnvironmentObject var person: Person
    
    var body: some View {
        
        VStack {
            Text(prompt)
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            HStack{
                Spacer()
                Button(action: {
                    
                    popUpEvent = false
                    addLine(text: acceptText, type: "N")
                    //addLine(text: result, type: "N")
                    if playerIsAttacked {
                        for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                            addLine(text: "They \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                            if randomChance(probability: 35) {
                                addLine(text: deathMsg, type: "N")
                                death()
                            }
                        }
                    }
                    if playerAttacks {
                        if randomChance(probability: 70){ //player attacks
                            
                            switch Int.random(in: 0...100){
                            case 0...35: //kills and jailed
                                for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                    addLine(text: "I \(randomAssaultAction()) their \(randomBodyPart())", type: "N")
                                }
                                addLine(text: "I've killed them.", type: "N")
                                addLine(text: jailMsg, type: "N")
                                jailPlayer()
                            case 36...50: //player gets killed
                                for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                    addLine(text: "They \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                }
                                addLine(text: deathMsg, type: "Death")
                                death()
                            default: //just kills
                                for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                    addLine(text: "I \(randomAssaultAction()) their \(randomBodyPart())", type: "N")
                                }
                                addLine(text: "I killed them and got away with it.", type: "N")
                            }
                         
                        } else { //attack fails
                            addLine(text: "I was too weak and could not attack first.", type: "N")
                            for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                addLine(text: "They \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                if randomChance(probability: 35) { //player dies
                                    addLine(text: deathMsg, type: "N")
                                    death()
                                }
                            }
                        }
                       
                    }
                    
                }, label: {
                    Text("Accept")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(BlueButton())
                
                Button(action: {
                    
                    popUpEvent = false
                    addLine(text: declineText, type: "N")
                    //addLine(text: result, type: "N")
                    
                }, label: {
                    Text("Decline")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(BlueButton())
                Spacer()
            }
        }
    }
    
    func addLine(text: String, type: String) -> Void {
        lines.append((text: text, type: type))
    }
    func death() -> Void {
        //addLine(text: "I have died.", type: "Death")
        person.dead = true
        person.alive = false
    }
    
    func jailPlayer() -> Void {
        //addLine(text: "I have become arrested for the murder of \(victim.name)", type: "Jail")
        let jt = Int.random(in: 2...20)
        addLine(text: "I have been put in jail for \(jt) years", type: "N")
        person.jailTime = jt
        person.jailed = true
        person.money = 0
        person.items = [""]
        person.occupation = ""
        
        if person.spouse != "" {
            addLine(text: "\(person.spouse) has left me because I have been put in jail", type: "N")
            person.spouse = ""
        }
    }
}

struct popUpView_Previews: PreviewProvider {
    static var previews: some View {
        @State var popUpEvent = true
        @State var result = false
        @State var selectedIndex = 0
        
        @State var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
        
        @State var Audra = Friend(name: "Audra", gender: "F")
        @State var people: [Friend] = [Audra]
        @StateObject var person = Person()
        popUpView(prompt: "You encounter a magician performing on the street. Would you like to initiate combat?",
                  acceptText: "I have initiated combat towards the street magician.",
                  declineText: "I decided not to assault the street magician.",
                  result: "poop",
                  playerIsAttacked: false,
                  playerAttacks: true,
                  jailMsg: "I have been arrested for the murder of an innocent street magician.",
                  deathMsg: "The street magician has killed me.",
                  popUpEvent: $popUpEvent,
                  lines: $lines)
        .environmentObject(person)
        .presentationDetents([.medium])    }
}
