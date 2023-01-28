//
//  PeopleView.swift
//  StinkLife
//
//  Created by Trevor Bollinger on 12/19/22.
//

import SwiftUI

struct PeopleView: View {
    
    @EnvironmentObject var person: Person
    @Binding var lines: [(text: String, type: String)]
    @Binding var people: [(name: String, gender: String, alive: String)]
    @Binding var selectedIndex: Int
    @Binding var randomLinesPositive: [String]
    @Binding var randomLinesNegative: [String]
    
    @State var showConfirmSuicide = false
    @State var paddingAmount = 10.0

    
    var body: some View {
        NavigationView {
            VStack {
                
                
                HStack {
                    AsyncImage(url: URL(string: "https://thispersondoesnotexist.com/image")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                    
                    Text("\(person.name)")
                        .font(.system(size:40))
                        .bold()
                }
                .padding(.vertical, paddingAmount)
                
                Divider()
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "backpack.fill")
                    Text("Inventory")
                        .font(.system(size:30))
                        .bold()
                }
                .padding(.vertical, paddingAmount)
                
                HStack {
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .padding(0.0)
                        Text("\(person.money)")
                            .padding(0.0)
                    }
                    .padding(.horizontal)
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .padding(0.0)
                        Text("\(person.money)")
                            .padding(0.0)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .padding(0.0)
                        Text("\(person.money)")
                            .padding(0.0)
                    }
                    .padding(.horizontal)
                }
                
                List {
                    NavigationLink(destination: StatsView()) {
                        Text("Character Information")
                        
                    }
                    NavigationLink(destination: StatsView()) {
                        Text("Get a Job")
                    }
                    NavigationLink(destination: StatsView()) {
                        Text("Shop")
                    }
                    
                    Button(action: {
                        person.money += 500
                    }, label: {
                        Text("Get Money")
                    })
                    
                    
                    Button {
                        showConfirmSuicide = true
                    } label: {
                        Text("Kill Yourself")
                    }

                }
                
            }
            //Death Cover View
            .fullScreenCover(isPresented: $person.dead) {
                ObituaryView(lines: $lines, selectedIndex: $selectedIndex)
            }
            //Suicide Confirmation Button
            .alert("Kill Yourself?", isPresented: $showConfirmSuicide) {
                Button {
                    person.dead = true
                } label: {
                    Text("frick yeah")
                }
                Button {
                    showConfirmSuicide = false
                } label: {
                    Text("nah")
                }
            }
        }
    }
}
//
//struct PeopleView_P: PreviewProvider {
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
//    @State static var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx"]
//    
//    @State static var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "anhilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "licked passionately", "took out a gun and shot", "bombed", "painted"]
//    
//    @State  static var randomLinesNegative = ["your penis exploded"]
//    
//    static var previews: some View {
//        PeopleView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative)
//            .environmentObject(Person())
//    }
//}
