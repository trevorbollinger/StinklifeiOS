import SwiftUI

struct tabBarView: View {
    
    @EnvironmentObject var person: Person
    @Binding var lines: [(text: String, type: String)]
    @Binding var people: [(name: String, gender: String, alive: String)]
    @Binding var selectedIndex: Int
    @Binding var randomLinesPositive: [String]
    @Binding var randomLinesNegative: [String]
    @Binding var bodyPartsList: [String]
    @Binding var assaultActionList: [String]
    
    
    let icons = [ "house", "person", "person.3" ]
    
    let tabNames = [ "Home", "You", "Friends" ]
    
    var body: some View {
        VStack {
            
            //View Controller
            switch selectedIndex {
            case 0: MainView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
            case 1: PeopleView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative)
            case 2: FriendsView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
            default: MainView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)

            }
            
            //Tab Bar
            Divider().frame(height: 2.0)
            HStack {
                ForEach(0..<tabNames.count, id: \.self) { i in
                    Spacer()
                    VStack {
                        Image(systemName: icons[i])
                            .frame(height: 20.0)
                            .font(.system(size:23))
                            .foregroundColor(self.selectedIndex == i ? Color("SelectedColor") : Color("AccentColor"))
                        Text("\(tabNames[i])")
                            .font(.system(size:10, weight: .medium, design: .default))
                            .foregroundColor(self.selectedIndex == i ? Color("SelectedColor") : Color("AccentColor"))
                            .padding(.top, 1.0)
                    }
                    .onTapGesture {
                        selectedIndex = i
                    }
                    
                    .frame(width: 70.0, height: 60.0)
                    Spacer()
                }
            }
            .frame(height: 41.0)
        }
    }
    
}

//struct tabBarView_P: PreviewProvider {
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
//    
//    @State static var randomLinesPositive = ["I got absolutely fucked!", "someone shit in the park!", "fuck! my dog died!", "someone bombed my house!", "somsone fucked ur mom! xD lmao", "I went to the strip club! ;)", "the eiffel tower has been relocated from Paris to Beijing!", "I ripped your bong so hard you threw up! gnarly bro!", "a stranger has broken into my house and fucked my dog! not again!"]
//    @State static var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx"]
//    
//    @State static var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "anhilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "licked passionately", "took out a gun and shot", "bombed", "painted"]
//    
//    @State  static var randomLinesNegative = ["your penis exploded"]
//
//    static var previews: some View {
//        tabBarView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
//            .environmentObject(Person())
//    }
//}
//
