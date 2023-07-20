//
//  StinklifeApp.swift
//  Stinklife
//
//  Created by Trevor Bollinger on 1/28/23.
//

import SwiftUI

@main
struct StinklifeApp: App {
    
    
    @StateObject var person = Person()
    
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

           
    @State var selectedIndex = 0
    
    @State var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "Cen")]
                                 
    
    
//    @State var people: [(name: String, gender: String, alive: String)] =
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
//     (name: "Nathan", gender: "F", alive: "true"),
//     (name: "NexFlax", gender: "M", alive: "true"),
//     (name: "Trevor", gender: "M", alive: "true")]
    
    @State var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx", "ovaries", "tiddies", "brain", "lungs", "internal arteries", "leg hair", "hair", "testes", "butt cheeks", "fat rolls", "armpit", "weenis", "fingernails", "throat", "tongue", "larynx", "pelvis", "large intestine", "chin", "ankle", "beard", "calf", "cheek", "earlobe", "eyebrow", "eyelash", "face", "forearm", "forehead", "heel", "gums", "teeth", "jaw", "knee", "knuckle", "mustache", "bladder", "blood", "bones", "buttocks", "cervix", "colon", "fallopian tubes", "follicles", "groin", "gullet", "hamstring", "heart", "jugular", "kidney", "labia majora", "labia minora", "loin", "lung", "mons pubis", "navel", "nerves", "nipples", "left nipple", "right nipple", "nostrils", "pancreas", "pubes", "rectum", "ribcage", "scalp", "scrotum", "shin", "spleen", "tendon", "tonsils", "umbilical cord", "urethra", "vulva", "windpipe", "womb", "wrist", "butt-crack", "esophagus", "anal canal", "trachea", "muscles of breathing", "placenta", "fetus", "embryo", "prostate", "seminal vesicles", "pituitary gland", "adrenal glands", "arteries", "capillaries", "veins", "bone marrow", "thymus", "pants", "shirt", "underwear", "tonsils", "spinal cord", "ventricle system", "cornea", "iris", "retinas", "eardrum", "taste buds", "body", "nintendo 3ds"]
    
    @State var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "annihilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "passionately licked", "took out a gun and shot", "bombed", "painted", "severed", "split", "ruptured", "exploded", "shit on", "pissed on", "cummed on", "sawed off", "cracked", "insulted", "poured acid on", "barbecued", "microwaved", "sat and farted on", "cremated", "eliminated", "discombobulated", "grazed", "drop-kicked", "sniped", "murdered", "rushed", "bombarded", "barraged", "molested", "clobbered", "hammered", "beat", "battled", "raided", "ruptured", "smashed", "shattered", "fractured", "splintered", "pulverized", "tore", "snapped", "busted", "damaged", "nudged", "tapped", "jostled", "jarred", "knocked", "jolted", "thumped", "butted", "clattered", "whacked", "slammed", "distorted", "mutated", "warped", "evolved", "reformed", "whooped", "whipped", "battered", "cleaved", "chopped", "chipped", "sliced", "snipped", "divided", "pruned", "trimmed", "axed", "slashed", "carved", "dissected", "pierced", "invaded", "infiltrated", "plunged", "toppled", "exposed", "excavated", "drilled", "hollowed out", "gouged", "tunneled through", "exhumed", "battled", "tussled", "wrestled", "scuffled", "dueled", "brawled", "jousted", "sparred", "clashed with", "grappled", "scrapped", "quarreled", "crammed", "molded", "re-arranged", "jammed", "packed", "compressed", "cobbled", "improved", "served", "decked", "grasped", "pounded",  "bolster", "flogged", "swatted", "reaped", "extracted", "inherited", "dispensed", "disposed of", "sacrificed", "conquered", "took", "stole", "snatched", "seized", "apprehended", "claimed", "wrenched", "plucked", "concealed", "buried", "squeezed", "bashed", "smacked", "slapped", "slammed", "punched", "clapped", "bumped", "poked", "walloped", "smoked", "zipped", "cemented", "glued", "fused", "booted", "punted", "withdrew", "deposited", "vacated", "thinned out", "shrunk", "expanded", "hoisted", "mounted", "evaporated", "deposited", "lodged", "dropped", "tampered with", "diminished", "jiggled", "juggled", "propelled", "spread", "unfolded", "peeled", "gaped", "unrolled", "displayed", "released", "got rid of", "shifted", "jarred", "nudged", "popped out", "displaced", "tapped", "dabbled with", "flirted with", "capered with", "played with", "toyed with", "gathered", "collected", "harvested", "vaccinated", "glared menacingly at", "shoved", "nudged", "strained", "thrusted", "squished", "crushed", "galloped", "chafed", "nuzzled", "caressed", "ground", "smudged", "smeared", "scrubbed", "lathered", "polished", "knead", "scraped", "stroked", "massaged", "buffed", "sandpapered", "brushed", "touched", "scrubbed", "smoothed", "wiped", "ransacked", "examined", "transferred", "throbbed", "reclined", "sprawled", "convulsed", "tottered", "juddered", "vibrated", "churned", "shuddered", "sloshed", "thrashed", "jerked", "jerked off", "chopped", "severed", "slit", "divided", "multiplied", "halved", "broke", "sundered", "separated", "ripped", "discontinued", "imprisoned", "entangled", "pinned", "restrained", "hooked", "pinched", "handcuffed", "hurled", "flipped", "tossed", "flung", "chucked", "heaved", "launched", "fired", "catapulted", "discharged", "lobbed", "pelted", "pegged", "ended", "terminated", "concluded", "fondled", "gloved", "palmed", "smoothed", "dabbed", "fingered", "pat", "twisted", "tilted", "rounded", "cranked", "switched", "swung", "twirled", "spun", "bended", "wielded", "handled", "employed", "adopted", "haunted", "adhered", "waddled", "splot", "desired", "lusted for", "yearned for", "observed", "stamped", "clumped", "flooded", "prowled", "bathed", "cleaned", "sold", "shampooed", "wheezed", "rugimated", "puzzled", "beat the shit out of", "trampled", "took a crowbar to", "t-bagged", "farted on", "presented my anus to", "flibberized", "snazzled", "skridoodled", "plooted", "wumpified", "fringulated", "snibbered", "glimflammed", "zibbled", "crunkled", "fiddlefumped", "klazooed", "bloopled", "twirped", "gribbled", "squizzled", "scriggled", "frobulated", "wazzled", "plinkified"]
    
    
    @State var randomEventsList = ["I got absolutely caca'd on!", "someone is dancing in the park!", "someone appreciated ur mom! xD haha", "I went to the craft fair! ;)", "the Eiffel tower has been relocated from Paris to Beijing again!", "I ripped my pants so hard I threw up! gnarly bro!", "someone fucked ur mom! xD haha","I got absolutely shit on!", "someone is masturbating in the park!", "someone fucked ur mom! xD haha", "I went to the strip club! ;)", "the Eiffel tower has been destroyed!", "I ripped my bong so hard I threw up! gnarly bro!", "someone fucked ur mom! xD haha", "The Eiffel Tower has been reconstructed!", "Man Found Having Tea Party With Nathan Again.", "Stripy Gun Likely To Win Village Show", "Local Man Wins Lettuce Growing Contest For the Third Time", "Woman With Excruciating Tattoo Arrested for 37th Time", "Viral Photo of Nathan Had Been Photoshopped", "Local man Set to Fly Out and Help With Shitstorm Relief Effort", "Man Buys Socks For Low Income Local Family", "Nathan Catches Train Across Country", "Man Jailed For Threatening Wife With Stripy Gun", "New Variety of Lettuce Set to Revolutionise Our Eating Habits", "Man With Excruciating Tattoo Suspected of Art Theft", "Small Shitstorm Forcast in Northern Regions", "Blue Socks Are the Latest Big Trend Says Top Fashion Designer", "Blue Nathan Escapes From Florida Zoo", "Stinktown Voted Nicest Place to Live in the World", "The World's Biggest Lettuce Measuring Over 1m", "Excruciating Tattoos Banned in North Korea", "Shitstorm Causes Devastation", "Socks Linked to Global Health Scare", "my microwave dinner exploded!", "a stranger has broken into my house and fucked my dog! not again!", "i just shit my pants!", "someone bombed my house!", "my pizza rolls caught on fire and burned down the entire neighborhood!", "Unicorn spotted in Central Park, New York City",
                                   "Local man discovers portal to alternate universe in his basement",
                                   "Scientists develop pill that makes you fluent in every language",
                                   "World's largest pizza delivered to the International Space Station",
                                   "Alien invasion thwarted by a group of determined cats",
                                   "Breaking news: Dogs can now talk!",
                                   "Superhero convention held in Las Vegas draws record-breaking crowds",
                                   "Pope announces plans to visit Mars to baptize first alien convert",
                                   "World's first underwater city discovered in the Pacific Ocean",
                                   "Study shows that eating pizza for breakfast boosts productivity",
                                   "Scientist invents time machine, goes back in time to high five dinosaurs",
                                   "Giant robot created to clean up plastic in the ocean",
                                   "Breaking news: The moon is made of cheese after all!",
                                   "Local woman wins lottery 10 times in a row",
                                   "Penguin elected as new mayor of Antarctica",
                                   "Study shows that drinking coffee increases intelligence",
                                   "Super-intelligent pigs discovered living in secret society",
                                   "Breaking news: Scientists discover Bigfoot is just a really tall bear",
                                   "Man claims he can control the weather with his mind",
                                   "Study shows that laughing at bad jokes increases lifespan",
                                   "Global pandemic claims the lives of 10 million people worldwide",
                                   "Climate change causes massive wildfires, leading to displacement of thousands of people",
                                   "Economic collapse leads to widespread poverty and unemployment",
                                   "Terrorist attack kills hundreds in major city",
                                   "Mass shooting at school leaves dozens dead or injured",
                                   "Natural disaster destroys entire community, leaving families homeless",
                                   "Political unrest leads to violent clashes and loss of life",
                                   "Global food shortage leads to malnutrition and starvation",
                                   "Rise in opioid addiction leads to increase in overdose deaths",
                                   "Cyberattack cripples infrastructure, leading to widespread chaos and confusion",
                                   "Air pollution causes thousands of premature deaths every year",
                                   "Rise in hate crimes sparks nationwide outrage and fear",
                                   "Collapse of healthcare system leads to preventable deaths and suffering",
                                   "Worsening income inequality leads to social unrest and tension",
                                   "Rise in domestic violence leads to loss of life and trauma for survivors",
                                   "Natural disaster destroys historical landmarks and cultural heritage sites",
                                   "Increase in suicide rates highlights mental health crisis",
                                   "Corruption scandal rocks government, leading to loss of trust and confidence",
                                   "War-torn country faces humanitarian crisis, with millions in need of aid",
                                   "High rates of homelessness and poverty plague major cities, highlighting systemic issues",
                                   "Giant sinkhole swallows entire city block in downtown Chicago",
                                   "Worldwide blackout leads to chaos and confusion",
                                   "Earthquake hits major city, causing widespread damage and loss of life",
                                   "New study shows alarming rise in mental health disorders among children",
                                   "Celebrity couple announces unexpected divorce after 20 years of marriage",
                                   "New virus strain discovered, more contagious than COVID-19",
                                   "Major airline goes bankrupt, leaving passengers stranded around the world",
                                   "Rising sea levels threaten to submerge coastal cities by 2050",
                                   "Huge data breach exposes personal information of millions of people",
                                   "Tropical storm causes widespread flooding and destruction in Caribbean islands",
                                   "Cyber attack on major bank results in loss of billions of dollars",
                                   "Vaccine-resistant strain of virus spreads rapidly across multiple countries",
                                   "Massive tornado touches down in Midwestern United States, leaving destruction in its wake",
                                   "Investigation reveals widespread corruption in local government",
                                   "New study shows that climate change is affecting global crop yields",
                                   "Escaped circus lion causes panic in small town",
                                   "Widespread internet outage leads to communication breakdowns around the world",
                                   "Famous landmark destroyed in devastating fire",
                                   "Rise in antibiotic-resistant infections causes global health crisis",
                                   "Freak hailstorm damages crops and property in rural farming communities",
                                   "Controversial new law sparks protests and civil unrest",
                                   "Newly discovered asteroid on collision course with Earth",
                                   "Investigation reveals systemic abuse in nursing homes across the country",
                                   "Major oil spill contaminates miles of coastline and kills marine life",
                                   "Famous musician dies unexpectedly, leaving fans devastated",
                                   "New study shows alarming rise in air pollution-related deaths",
                                   "Contaminated water crisis affects millions in major city",
                                   "Rise in white nationalist groups sparks concern among law enforcement officials",
                                   "Terrorist attack at sports stadium leaves dozens dead or injured",
                                   "Economic recession causes spike in homelessness and poverty",
                                   "Newly discovered superbug poses threat to global health",
                                   "Study shows that deforestation is leading to loss of biodiversity and climate change",
                                   "High levels of toxic waste found in drinking water in small town",
                                   "Animal cruelty scandal rocks major corporation",
                                   "Barack Obama has died",
                                   "The Dalai Lama has kissed you",
                                   "Rising sea temperatures lead to decline in marine ecosystems",
                                   "Huge wildfire threatens to engulf residential areas in California",
                                   "Controversial new vaccine mandate leads to protests and civil unrest",
                                   "Increase in hate speech online leads to calls for stricter regulation",
                                   "New study shows that social media use is linked to depression and anxiety",
                                   "Terrorist attack on major shopping mall leaves shoppers traumatized",
                                   "Famous actor arrested for involvement in major drug trafficking ring",
                                   "Massive cyber attack on government database exposes sensitive information",
                                   "Rise in hate crimes against minority communities sparks nationwide outrage",
                                   "Study shows that plastics in the ocean are harming marine life and food chains",
                                   "Controversial new trade deal leads to loss of jobs and economic instability",
                                   "Natural disaster destroys major landmark and tourist destination",
                                   "New study shows that pesticides are causing decline in bee populations",
                                   "Huge surge in gun violence leads to calls for gun control legislation",
                                   "Global warming leads to melting of Arctic ice and extinction of polar bears",
                                   "Local community comes together to raise funds for family in need",
                                   "Retired teacher volunteers to read stories to children at local library",
                                   "Local animal shelter finds homes for record number of pets",
                                   "High school student starts initiative to donate computers to underprivileged students",
                                   "Community garden project brings neighbors together and provides fresh produce",
                                   "Kind stranger pays for family's groceries at checkout",
                                   "Firefighters rescue kitten from tree, reunite it with grateful owner",
                                   "Local organization provides free meals to those in need during pandemic",
                                   "Volunteers clean up local park, making it a safe and beautiful space for all to enjoy",
                                   "Neighbors organize surprise parade for child's birthday during lockdown",
                                   "Local business donates portion of profits to charity every month",
                                   "Community members rally around family after house fire, providing meals and shelter",
                                   "Teenager creates organization to provide free tutoring to fellow students",
                                   "Retired couple spends retirement traveling and volunteering at animal shelters across the country",
                                   "City officials team up with local artists to beautify underpass with murals",
                                   "Strangers work together to rescue dog stranded on frozen lake",
                                   "Local nonprofit hosts free art classes for children in low-income neighborhoods",
                                   "Kindergarten teacher creates sensory garden for students with disabilities",
                                   "Local bakery donates bread to homeless shelter every week",
                                   "Community members participate in beach cleanup, preserving natural beauty for future generations",
                                   "Local business hosts charity auction, raising thousands of dollars for children's hospital",
                                   "Teenager organizes community bike ride to promote physical activity and outdoor recreation",
                                   "Volunteers spend weekend building wheelchair ramp for elderly neighbor",
                                   "Local library hosts book drive, providing books to children in underserved communities",
                                   "Strangers team up to help stranded driver change tire on side of highway",
                                   "Teacher spends extra time after school tutoring struggling students",
                                   "Local park installs wheelchair swing, making it accessible to all children",
                                   "Community members start grassroots campaign to plant trees and combat climate change",
                                   "Neighbors come together to support local small business struggling during pandemic",
                                   "Volunteers provide free home repairs for elderly and disabled residents"]
    
    
    
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
//
//    func randomPerson() -> Friend {
//        return people[Int.random(in: 0..<people.count)] }
    
    func addLine(text: String, type: String) -> Void {
        lines.append((text: text, type: type))
    }
    
    var body: some Scene {
        WindowGroup {
            tabBarView(lines: $lines, selectedIndex: $selectedIndex, randomEventsList: $randomEventsList, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
                .environmentObject(person)

        }
        
        
    }
}

