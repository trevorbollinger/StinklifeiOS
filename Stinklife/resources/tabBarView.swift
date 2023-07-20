import SwiftUI

struct tabBarView: View {
    
    @EnvironmentObject var person: Person
    
//    @EnvironmentObject var AJ: Friend
//    @EnvironmentObject var Andrew: Friend
//    @EnvironmentObject var Audra: Friend
//    @EnvironmentObject var Augie: Friend
//    @EnvironmentObject var Bayley: Friend
//    @EnvironmentObject var Gabe: Friend
//    @EnvironmentObject var Jace: Friend
//    @EnvironmentObject var Jared: Friend
//    @EnvironmentObject var Jerika: Friend
//    @EnvironmentObject var Luke: Friend
//    @EnvironmentObject var Mason: Friend
//    @EnvironmentObject var Nathan: Friend
//    @EnvironmentObject var NexFlax: Friend
//    @EnvironmentObject var Trevor: Friend

    
    @StateObject var AJ = Friend(name: "AJ", gender: "M")
    @StateObject var Andrew = Friend(name: "Andrew", gender: "M")
    @StateObject var Audra = Friend(name: "Audra", gender: "F")
    @StateObject var Augie = Friend(name: "Augie", gender: "M")
    @StateObject var Bayley = Friend(name: "Bayley", gender: "M")
    @StateObject var Gabe = Friend(name: "Gabe", gender: "M")
    @StateObject var Jace = Friend(name: "Jace", gender: "M")
    @StateObject var Jared = Friend(name: "Jared", gender: "M")
    @StateObject var Jaden = Friend(name: "Jaden", gender: "M")
    @StateObject var Jerika = Friend(name: "Jerika", gender: "F")
    @StateObject var Luke = Friend(name: "Luke", gender: "M")
    @StateObject var Mason = Friend(name: "Mason", gender: "M")
    @StateObject var Nathan = Friend(name: "Nathan", gender: "F")
    @StateObject var NexFlax = Friend(name: "NexFlax", gender: "M")
    @StateObject var Trevor = Friend(name: "Trevor", gender: "M")
    @StateObject var Zach = Friend(name: "Zach", gender: "M")
    @StateObject var RyanFoley = Friend(name: "Ryan Foley", gender: "M")
    
    @Binding var lines: [(text: String, type: String)]
   // @Binding var people: [Friend]
    @Binding var selectedIndex: Int
    @Binding var randomEventsList: [String]
    @Binding var bodyPartsList: [String]
    @Binding var assaultActionList: [String]
    
    
    @State var people: [Friend] = []
    
    
    let icons = [ "house", "person", "person.3" ]
    
    let tabNames = [ "Home", "You", "Friends" ]
    
    
    
    var body: some View {
        VStack {
            
            //View Controller
            switch selectedIndex {
            case 0: MainView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
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
                    .environmentObject(RyanFoley)
                    .environmentObject(person)

            case 1: PeopleView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
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
                    .environmentObject(RyanFoley)
                    .environmentObject(person)

            case 2: FriendsView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
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
                    .environmentObject(RyanFoley)
                    .environmentObject(person)
            default: MainView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)

            }
            
            //Tab Bar
            Divider().frame(height: 2.0)
            HStack {
                if person.alive {
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
                } else {
                    Spacer()
                    VStack {
                        Image(systemName: icons[0])
                            .frame(height: 20.0)
                            .font(.system(size:23))
                            .foregroundColor(self.selectedIndex == 0 ? Color("SelectedColor") : Color("AccentColor"))
                        Text("\(tabNames[0])")
                            .font(.system(size:10, weight: .medium, design: .default))
                            .foregroundColor(self.selectedIndex == 0 ? Color("SelectedColor") : Color("AccentColor"))
                            .padding(.top, 1.0)
                    }
                    .onTapGesture {
                        selectedIndex = 0
                        
                    }
                    
                    .frame(width: 70.0, height: 60.0)
                    Spacer()
                }
            }
            .frame(height: 41.0)
        }
        //Death Cover View
        .sheet(isPresented: $person.dead) {
            ObituaryView(lines: $lines, people: $people, selectedIndex: $selectedIndex)
                .presentationDetents([.medium, .large])
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
                .environmentObject(RyanFoley)
                .environmentObject(person)
        }
        //Character Creation Sheet
        .fullScreenCover(isPresented: $person.needsCreation) {
            ZStack {
                //Color.blue
                VStack {
                    Spacer()
            
                    Text("welcome to stinktown!")
                        .padding(.vertical)
                    
                    List {
                        TextField("", text: $person.name )
                            .disableAutocorrection(true)
                        
                        Stepper("Starting Age: \(person.age)", value: $person.age)
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)

                    Spacer()
                    
                    Button(action: {
                        if people.count < 17 {
                            people = [AJ, Andrew, Audra, Augie, Bayley, Gabe, Jace, Jared, Jaden, Jerika, Luke, Mason, Nathan, NexFlax, Trevor, Zach, RyanFoley] }
                        person.needsCreation = false
                    }, label: {
                        Text("Begin Life")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    })
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.blue)
                    .background(.blue)
                    .cornerRadius(15)
                    .padding(.all)
                }
            }
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
//    @State static var randomEventsList = ["I got absolutely fucked!", "someone shit in the park!", "fuck! my dog died!", "someone bombed my house!", "somsone fucked ur mom! xD lmao", "I went to the strip club! ;)", "the eiffel tower has been relocated from Paris to Beijing!", "I ripped your bong so hard you threw up! gnarly bro!", "a stranger has broken into my house and fucked my dog! not again!"]
//    @State static var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx"]
//    
//    @State static var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "anhilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "licked passionately", "took out a gun and shot", "bombed", "painted"]
//    
//    @State  static var randomLinesNegative = ["your penis exploded"]
//
//    static var previews: some View {
//        tabBarView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
//            .environmentObject(Person())
//    }
//}
//
