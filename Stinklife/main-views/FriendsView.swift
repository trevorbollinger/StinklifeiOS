//
//  FriendsView.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/30/22.
//

import SwiftUI

struct FriendsView: View {
    
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
    //  @Binding var people: [(name: String, gender: String, alive: String)]
    @Binding var people: [Friend]
    
    @Binding var selectedIndex: Int
    @Binding var randomEventsList: [String]
    @Binding var bodyPartsList: [String]
    @Binding var assaultActionList: [String]
    
    @State var showChatMenu = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<self.people.count, id: \.self) { i in
                        if people[i].alive == true {
                            Menu {
                                
                                // CHAT WITH
                                Button(action: {
                                    switch Int.random(in: 0...100) {
                                    case 0...25:
                                        addLine(text: "I said hello to \(people[i].name), and they said hello back.", type: "Soc")
                                    case 26...50:
                                        addLine(text: "I tried to say hello to \(people[i].name), but they were wearing airpods and didn't hear me.", type: "Soc")
                                    case 51...75:
                                        addLine(text: "I said hello to \(people[i].name), and they told me to suck a cucumber", type: "Soc")
                                    case 76...90:
                                        addLine(text: "I decided not to say hello to \(people[i].name) because I remembered that I am very stinky today", type: "Soc")
                                    case 91...100:
                                        addLine(text: "I said hello to \(people[i].name), and they immediately had a very good time.", type: "Soc")
                                    default: break
                                    }
                                    self.selectedIndex = 0
                                }) {
                                    Label("Chat With", systemImage: "figure.socialdance")
                                }
                                
                                // PROPOSE
                                Button(action: {
                                    self.selectedIndex = 0
                                    switch Int.random(in: 0...100){
                                    case 0...40:
                                        addLine(text: "I asked \(people[i].name) to marry me, and they said yes!", type: "Soc")
                                        if person.spouse != "" {
                                            addLine(text: "\(person.spouse) has left me because they caught me proposing to \(people[i].name)", type: "Soc")
                                        }
                                        person.spouse = people[i].name
                                        addLine(text: "I am now in a relationship with \(person.spouse)", type: "Soc")
                                        
                                    case 41...80:
                                        addLine(text: "I asked \(people[i].name) to marry me, and they said no because I am too stinky.", type: "Soc")

                                    case 81...98:
                                        addLine(text: "I asked \(people[i].name) to marry me, and they laughed in my face and ran away.", type: "Soc")

                                    case 99...100:
                                        addLine(text: "I asked \(people[i].name) to marry me, and they slit my throat.", type: "Soc")
                                        death()
                                    default:
                                        addLine(text: "I asked \(people[i].name) to marry me, and they said no.", type: "Soc")

                                    }
                                }) {
                                    Label("Propose", systemImage: "heart")
                                }
                                
                                
                                // SEX WITH
                                Button(action: {
                                    self.selectedIndex = 0
                                    if randomChance(probability: 70) {
                                        addLine(text: "I sex'd the absolute fuck out of \(people[i].name)", type: "Soc")
                                        person.sexCount += 1
                                        if person.spouse != "" && person.spouse != people[i].name && randomChance(probability: 45){
                                            addLine(text: "\(person.spouse) has left me because I cheated on them with \(people[i].name)", type: "Soc")
                                            person.spouse = ""

                                        }
                                    } else {
                                        addLine(text: "I tried to sex with \(people[i].name), but my gamer dick slipped!", type: "Soc")
                                        if person.spouse != "" && person.spouse != people[i].name && randomChance(probability: 25){
                                            addLine(text: "\(person.spouse) caught me trying to bone \(people[i].name) and has filed for divorce.", type: "Soc")
                                            person.spouse = ""
                                        }
                                    }
                                }) {
                                    Label("Sex With", systemImage: "figure.socialdance")
                                }
                                
                                // ASSAULT
                                Button(action: {
                                    self.selectedIndex = 0
                                    
                                    if(person.items == [""]){ //NO WEAPON
                                        if (randomChance(probability: 97)) { //NO WEEZER
                                            if(randomChance(probability: 70)){ //punch hits
                                                addLine(text: "I don't have a weapon, so I punched \(people[i].name)!", type: "Ass")
                                                addLine(text: "I \(randomAssaultAction()) \(people[i].name)'s \(randomBodyPart())", type: "N")
                                            } else {                //punch misses
                                                addLine(text: "I attempted to punch \(people[i].name)'s \(randomBodyPart()), but I missed!", type: "Ass")
                                                addLine(text: "\(people[i].name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                                if randomChance(probability: 20) {
                                                    addLine(text: "\(people[i].name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                                    death()
                                                }
                                                
                                            }
                                        } else { // weezer friend
                                            addLine(text: "I made \(people[i].name) listen to weezer!", type: "Ass")
                                        }
                                    }
                                    
                                    else if(person.items != [""]){ //YES WEAPON
                                        if (randomChance(probability: 97)) { //NO WEEZER
                                            if checkForItem(target: "gun", person: person) { //assault: attack with gun
                                                addLine(text: "I used my gun to shoot \(people[i].name), I aimed for their \(randomBodyPart()).", type: "Ass")
                                                for _ in 0..<Int.random(in: 1...6) { //random number of attacks
                                                    addLine(text: "I \(randomAssaultAction()) \(people[i].name)'s \(randomBodyPart())", type: "N")
                                                }
                                                if randomChance(probability: 75) { //friend dies from gun
                                                    addLine(text:"\(people[i].name) has died from their injuries", type: "Death")
                                                    people[i].alive = false
                                                    if randomChance(probability: 75) { //player becomes jailed
                                                        jailPlayer(victim: people[i])
                                                    }
                                                } else { //friend survives gun attack
                                                    if randomChance(probability: 15) {
                                                        addLine(text: "I missed.", type: "N")
                                                        addLine(text: "\(people[i].name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                                        addLine(text: "\(people[i].name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                                        death()
                                                    } else {
                                                        addLine(text:"\(people[i].name) has survived their injuries", type: "N")

                                                    }
                                                }
                                                
                                            } else if checkForItem(target: "knife", person: person) { //assault: attack with knife
                                                addLine(text: "I stabbed \(people[i].name) with my knife", type: "Ass")
                                                for _ in 0..<Int.random(in: 1...4) { //random number of attacks
                                                    addLine(text: "I \(randomAssaultAction()) \(people[i].name)'s \(randomBodyPart())", type: "N")
                                                }
                                                if randomChance(probability: 40) { //friend dies from knife attack
                                                    addLine(text:"\(people[i].name) has died from their injuries", type: "Death")
                                                    people[i].alive = false
                                                    if randomChance(probability: 75) { //player becomes jailed
                                                        jailPlayer(victim: people[i])
                                                    }
                                                } else { //friend survives knife attack
                                                    if randomChance(probability: 20) {
                                                        addLine(text: "I missed.", type: "N")
                                                        addLine(text: "\(people[i].name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                                        addLine(text: "\(people[i].name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "N")
                                                        death()
                                                    } else {
                                                        addLine(text:"\(people[i].name) has survived their injuries", type: "N")
                                                    }                                                }
                                            }
                                        } else { //weezer friend
                                            addLine(text: "I made \(people[i].name) listen to weezer!", type: "Ass")
                                            
                                        }
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
    
    func randomBodyPart() -> String {
        return bodyPartsList[Int.random(in: 0..<bodyPartsList.count)] }
    
    func randomAssaultAction() -> String {
        return assaultActionList[Int.random(in: 0..<assaultActionList.count)] }
    
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
    
    func jailPlayer(victim: Friend) -> Void {
        addLine(text: "I have become arrested for the murder of \(victim.name)", type: "Jail")
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
//    @State static var randomEventsList = ["I got absolutely fucked!", "someone shit in the park!", "fuck! my dog died!", "someone bombed my house!", "somsone fucked ur mom! xD lmao", "I went to the strip club! ;)", "the eiffel tower has been relocated from Paris to Beijing!", "I ripped your bong so hard you threw up! gnarly bro!", "a stranger has broken into my house and fucked my dog! not again!"]
//    
//    @State static var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx"]
//    
//    @State static var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "anhilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "passionately licked", "took out a gun and shot", "bombed", "painted"]
//    
//    @State  static var randomLinesNegative = ["your penis exploded"]
//    
//    static var previews: some View {
//        FriendsView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
//            .environmentObject(Person())
//    }
//}
