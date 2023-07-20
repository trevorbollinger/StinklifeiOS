//
//  MainView.swift
//  StinkLife
//
//  Created by Trevor Bollinger on 12/19/22.
//

import SwiftUI

struct MainView: View {
    
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
    
    @State var eventProbability = 15.0
    
    
    @State var countries = [
        "Afghanistan",
        "Stinktown",
        "Albania",
        "Algeria",
        "American Samoa",
        "Andorra",
        "Angola",
        "Anguilla",
        "Antarctica",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Aruba",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas ",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin",
        "Bermuda",
        "Bhutan",
        "Bolivia",
        "Bonaire, Sint Eustatius and Saba",
        "Bosnia and Herzegovina",
        "Botswana",
        "Bouvet Island",
        "Brazil",
        "British Indian Ocean Territory ",
        "Brunei Darussalam",
        "Bulgaria",
        "Burkina Faso",
        "Burundi",
        "Cabo Verde",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Cayman Islands ",
        "Central African Republic ",
        "Chad",
        "Chile",
        "China",
        "Christmas Island",
        "Cocos (Keeling) Islands ",
        "Colombia",
        "Comoros ",
        "Congo",
        "Cook Islands",
        "Costa Rica",
        "Croatia",
        "Cuba",
        "Curaçao",
        "Cyprus",
        "Czechia",
        "Côte d'Ivoire",
        "Denmark",
        "Djibouti",
        "Dominica",
        "Dominican Republic",
        "Ecuador",
        "Egypt",
        "El Salvador",
        "Equatorial Guinea",
        "Eritrea",
        "Estonia",
        "Eswatini",
        "Ethiopia",
        "Falkland Islands",
        "Faroe Islands",
        "Fiji",
        "Finland",
        "France",
        "French Guiana",
        "French Polynesia",
        "French Southern Territories",
        "Gabon",
        "Gambia ",
        "Georgia",
        "Germany",
        "Ghana",
        "Gibraltar",
        "Greece",
        "Greenland",
        "Grenada",
        "Guadeloupe",
        "Guam",
        "Guatemala",
        "Guernsey",
        "Guinea",
        "Guinea-Bissau",
        "Guyana",
        "Haiti",
        "Heard Island and McDonald Islands",
        "Holy See ",
        "Honduras",
        "Hong Kong",
        "Hungary",
        "Iceland",
        "India",
        "Indonesia",
        "Iran",
        "Iraq",
        "Ireland",
        "Isle of Man",
        "Israel",
        "Italy",
        "Jamaica",
        "Japan",
        "Jersey",
        "Jordan",
        "Kazakhstan",
        "Kenya",
        "Kiribati",
        "North Korea",
        "South Korea",
        "Kuwait",
        "Kyrgyzstan",
        "Lao People's Democratic Republic ",
        "Latvia",
        "Lebanon",
        "Lesotho",
        "Liberia",
        "Libya",
        "Liechtenstein",
        "Lithuania",
        "Luxembourg",
        "Macao",
        "Madagascar",
        "Malawi",
        "Malaysia",
        "Maldives",
        "Mali",
        "Malta",
        "Marshall Islands ",
        "Martinique",
        "Mauritania",
        "Mauritius",
        "Mayotte",
        "Mexico",
        "Micronesia",
        "Moldova",
        "Monaco",
        "Mongolia",
        "Montenegro",
        "Montserrat",
        "Morocco",
        "Mozambique",
        "Myanmar",
        "Namibia",
        "Nauru",
        "Nepal",
        "Netherlands ",
        "New Caledonia",
        "New Zealand",
        "Nicaragua",
        "Niger ",
        "Nigeria",
        "Niue",
        "Norfolk Island",
        "Northern Mariana Islands ",
        "Norway",
        "Oman",
        "Pakistan",
        "Palau",
        "Palestine, State of",
        "Panama",
        "Papua New Guinea",
        "Paraguay",
        "Peru",
        "Philippines ",
        "Pitcairn",
        "Poland",
        "Portugal",
        "Puerto Rico",
        "Qatar",
        "Republic of North Macedonia",
        "Romania",
        "Russian Federation ",
        "Rwanda",
        "Réunion",
        "Saint Barthélemy",
        "Saint Helena, Ascension and Tristan da Cunha",
        "Saint Kitts and Nevis",
        "Saint Lucia",
        "Saint Martin (French part)",
        "Saint Pierre and Miquelon",
        "Saint Vincent and the Grenadines",
        "Samoa",
        "San Marino",
        "Sao Tome and Principe",
        "Saudi Arabia",
        "Senegal",
        "Serbia",
        "Seychelles",
        "Sierra Leone",
        "Singapore",
        "Sint Maarten (Dutch part)",
        "Slovakia",
        "Slovenia",
        "Solomon Islands",
        "Somalia",
        "South Africa",
        "South Georgia and the South Sandwich Islands",
        "South Sudan",
        "Spain",
        "Sri Lanka",
        "Sudan ",
        "Suriname",
        "Svalbard and Jan Mayen",
        "Sweden",
        "Switzerland",
        "Syrian Arab Republic",
        "Taiwan",
        "Tajikistan",
        "Tanzania",
        "Thailand",
        "Timor-Leste",
        "Togo",
        "Tokelau",
        "Tonga",
        "Trinidad and Tobago",
        "Tunisia",
        "Turkey",
        "Turkmenistan",
        "Turks and Caicos Islands",
        "Tuvalu",
        "Uganda",
        "Ukraine",
        "United Arab Emirates ",
        "United Kingdom of Great Britain and Northern Ireland",
        "United States Minor Outlying Islands",
        "United States of America",
        "Uruguay",
        "Uzbekistan",
        "Vanuatu",
        "Venezuela",
        "Viet Nam",
        "Virgin Islands (British)",
        "Virgin Islands (U.S.)",
        "Wallis and Futuna",
        "Western Sahara",
        "Yemen",
        "Zambia",
        "Zimbabwe",
        "Åland Islands",
        "your moms house"
    ];
    
    @State var popUpEvent = false
    
    var body: some View {
        NavigationView {
            //Main VStack
            VStack {
                
                //ScrollView
                ScrollView {
                    ScrollViewReader { value in
                        
                        ForEach(0..<lines.count, id: \.self) { i in
                            ZStack {
                                Color("MainColor")
                                Line(text: lines[i].text, type: lines[i].type)
                            }
                        }
                        .onChange(of: lines.count) { _ in
                            value.scrollTo(lines.count - 1)
                        }
                        .onAppear() {
                            value.scrollTo(lines.count - 1)
                        }
                    }
                }
                
                
                //Age Button
                if person.alive {
                    Button(action: {
                        person.increaseAge()
                        addLine(text: "Age \(person.age)", type: "Age")
                        if person.age == 69 {
                            addLine(text: "nice!", type: "Cen")
                        }
                        
                        if person.jailed && person.jailTime <= 0 {
                            addLine(text: "I have been released from jail.", type: "N")
                            person.jailed = false
                        }
                        
                        

                        randomEvents()
                    }, label: {
                        Text("Age")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(BlueButton())
                } else {
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
                }
    
            }
            .sheet(isPresented: $popUpEvent) {
                
                switch Int.random(in: 0...100){
                case 0...50:
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
                    .presentationDetents([.medium])


                case 51...100:
                    popUpView(prompt: "You are walking home from the store and get mugged. Would you like to initiate combat?",
                              acceptText: "I have attacked my attacker.",
                              declineText: "I started crying and ran away from my attacker.",
                              result: "poop",
                              playerIsAttacked: false,
                              playerAttacks: true,
                              jailMsg: "I have been arrested for murdering my attacker, even though it was in self defense.",
                              deathMsg: "I have lost the fight against my attacker and died.",
                              popUpEvent: $popUpEvent,
                              lines: $lines)
                    .environmentObject(person)
                    .presentationDetents([.medium])

                default:
                    popUpView(prompt: "You encounter a magician performing on the street. Would you like to initiate combat?",
                              acceptText: "I have initiated combat towards the street magician.",
                              declineText: "I decided not to assault the street magician.",
                              result: "poop",
                              playerIsAttacked: false,
                              playerAttacks: true,
                              jailMsg: "jail",
                              deathMsg: "death",
                              popUpEvent: $popUpEvent,
                              lines: $lines)
                    .environmentObject(person)
                    .presentationDetents([.medium])

                }
            }
            
            //NavigationView Modifiers
            .navigationTitle("\(person.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        person.needsCreation = true
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
            }
            


        }
    }
    
    
    func randomEvents(){
        if person.age > 0 {
            if randomChance(probability: 55) {
                addLine(text: "BREAKING NEWS: "+randomEvent() , type: "Rand") }
            
            if randomChance(probability: 12) {
                addLine(text: "\(randomCountry()) has declared war on \(randomCountry())", type: "Rand") }
            
            if randomChance(probability: 10) {
                addLine(text: "The nations of \(randomCountry()), \(randomCountry()), and \(randomCountry()) have signed a peace treaty.", type: "Rand") }
            
            if randomChance(probability: 0) {
                addLine(text: "\(randomPerson().name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "Rand")
                death()
            }
            
            if randomChance(probability: 18) {
                addLine(text: "\(randomPerson().name) has \(randomAssaultAction()) my \(randomBodyPart())", type: "Rand") }
            
            if randomChance(probability: 3) {
                let forkliftVictim = randomPerson()
                //selectedIndex = 2
                forkliftVictim.alive = false
                addLine(text: "\(forkliftVictim.name) has died from a \(randomBodyPart()) injury, following a forklift combat accident", type: "Rand")

            }
            
            if randomChance(probability: (person.deathChance/100)) {
                death()
            }
            
            if randomChance(probability: eventProbability) && !person.jailed && person.age >= 10 {
                popUpEvent = true
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
    
    func randomBodyPart() -> String {
        return bodyPartsList[Int.random(in: 0..<bodyPartsList.count)] }
    
    func randomAssaultAction() -> String {
        return assaultActionList[Int.random(in: 0..<assaultActionList.count)] }
    
    func randomCountry() -> String {
        return countries[Int.random(in: 0..<countries.count)] }
    
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



//struct MainView_Previews: PreviewProvider {
//
//    @State static var selectedIndex = 0
//
//    @State static var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
//
//    @State static var people: [(name: String, gender: String, alive: String)] =
//    [(name: "AJ", gender: "M", alive: "true"),
//     (name: "Andrew", gender: "M", alive: "true"),
//     (name: "Audra", gender: "F", alive: "true"),
//     (name: "Augie", gender: "M", alive: "true"),
//     (name: "Bayley", gender: "M", alive: "true"),
//     (name: "Gabe", gender: "M", alive: "true"),
//     (name: "Jace", gender: "M", alive: "true"),
//     (name: "Jared", gender: "M", alive: "true"),
//     (name: "Jerika", gender: "F", alive: "true"),
//     (name: "Luke", gender: "M", alive: "true"),
//     (name: "Mason", gender: "M", alive: "true"),
//     (name: "Nathan", gender: "M", alive: "true"),
//     (name: "NexFlax", gender: "M", alive: "true"),
//     (name: "Trevor", gender: "M", alive: "true")]
//
//
//    @State static var randomEventsList = ["I got absolutely fucked!", "someone shit in the park!", "frick! my dog died!", "someone bombed my house!", "somsone fucked ur mom! xD lmao", "I went to the strip club! ;)", "the eiffel tower has been relocated from Paris to Beijing!", "I ripped your bong so hard you threw up! gnarly bro!", "a stranger has broken into my house and fucked my dog! not again!"]
//    @State static var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx"]
//
//    @State static var assaultActionList = ["inverted", "creamed", "fricked", "decimated", "annihilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my head into", "licked passionately", "took out a gun and shot", "bombed", "painted"]
//
//
//    static var previews: some View {
//        MainView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
//            .environmentObject(Person())
//    }
//}
//
