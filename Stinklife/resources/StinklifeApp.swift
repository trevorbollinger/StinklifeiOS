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
      
      @State var selectedIndex = 0
      
      @State var lines: [(text: String, type: String)] = [(text: "wellcom stionk", type: "W")]
      
      
      @State var people: [(name: String, gender: String, alive: String)] =
      [(name: "AJ", gender: "M", alive: "true"),
       (name: "Andrew", gender: "M", alive: "true"),
       (name: "Audra", gender: "F", alive: "true"),
       (name: "Augie", gender: "M", alive: "true"),
       (name: "Bayley", gender: "M", alive: "true"),
       (name: "Gabe", gender: "M", alive: "true"),
       (name: "Jace", gender: "M", alive: "true"),
       (name: "Jared", gender: "M", alive: "true"),
       (name: "Jerika", gender: "F", alive: "true"),
       (name: "Luke", gender: "M", alive: "true"),
       (name: "Mason", gender: "M", alive: "true"),
       (name: "Nathan", gender: "M", alive: "true"),
       (name: "NexFlax", gender: "M", alive: "true"),
       (name: "Trevor", gender: "M", alive: "true")]
      
      @State var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "back", "fingers", "eyelid", "coccyx", "brain", "lungs", "internal arteries", "leg hair", "hair", "butt cheeks", "fat rolls", "armpit", "weenis", "fingernails", "throat", "tongue", "larynx", "pelvis", "large intestine", "chin", "ankle", "beard", "calf", "cheek", "earlobe", "eyebrow", "eyelash", "face", "forearm", "forehead", "heel", "gums", "teeth", "jaw", "knee", "knuckle", "mustache", "bladder", "blood", "bones", "buttocks", "colon", "fallopian tubes", "follicles", "groin", "gullet", "hamstring", "heart", "jugular", "kidney", "loin", "lung", "navel", "nerves", "nipples", "left nipple", "right nipple", "nostrils", "pancreas", "pubes", "rectum", "ribcage", "scalp", "shin", "spleen", "tendon", "tonsils", "umbilical cord", "urethra", "vulva", "windpipe", "womb", "wrist", "butt-crack", "esophagus", "anal canal", "trachea", "muscles of breathing", "placenta", "fetus", "embryo", "pituitary gland", "adrenal glands", "arteries", "capillaries", "veins", "bone marrow", "thymus", "pants", "shirt", "underwear", "tonsils", "spinal cord", "ventricle system", "cornea", "iris", "retinas", "eardrum", "taste buds", "body"]
      
      @State var assaultActionList = ["inverted", "creamed", "decimated", "annihilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "passionately licked", "took out a gun and shot", "bombed", "painted", "severed", "split", "ruptured", "exploded", "sawed off", "cracked", "insulted", "poured acid on", "barbecued", "microwaved", "sat and farted on", "cremated", "eliminated", "discombobulated", "grazed", "drop-kicked", "sniped", "murdered", "rushed", "bombarded", "barraged", "molested", "clobbered", "hammered", "beat", "battled", "raided", "ruptured", "smashed", "shattered", "fractured", "splintered", "pulverized", "tore", "snapped", "busted", "damaged", "nudged", "tapped", "jostled", "jarred", "knocked", "jolted", "thumped", "butted", "clattered", "whacked", "slammed", "distorted", "mutated", "warped", "evolved", "reformed", "whooped", "whipped", "battered", "cleaved", "chopped", "chipped", "sliced", "snipped", "divided", "pruned", "trimmed", "axed", "slashed", "carved", "dissected", "pierced", "invaded", "infiltrated", "plunged", "toppled", "exposed", "excavated", "drilled", "hollowed out", "gouged", "tunneled through", "exhumed", "battled", "tussled", "wrestled", "scuffled", "dueled", "brawled", "jousted", "sparred", "clashed with", "grappled", "scrapped", "quarreled", "crammed", "molded", "re-arranged", "jammed", "packed", "compressed", "cobbled", "improved", "served", "decked", "grasped", "pounded",  "bolster", "flogged", "swatted", "reaped", "extracted", "inherited", "dispensed", "disposed of", "sacrificed", "conquered", "took", "stole", "snatched", "seized", "apprehended", "claimed", "wrenched", "plucked", "concealed", "buried", "squeezed", "bashed", "smacked", "slapped", "slammed", "punched", "clapped", "bumped", "poked", "walloped", "smoked", "zipped", "cemented", "glued", "fused", "booted", "punted", "withdrew", "deposited", "vacated", "thinned out", "shrunk", "expanded", "hoisted", "mounted", "evaporated", "deposited", "lodged", "dropped", "tampered with", "diminished", "jiggled", "juggled", "propelled", "spread", "unfolded", "peeled", "gaped", "unrolled", "displayed", "released", "got rid of", "shifted", "jarred", "nudged", "popped out", "displaced", "tapped", "dabbled with", "flirted with", "capered with", "played with", "toyed with", "gathered", "collected", "harvested", "shoved", "nudged", "strained", "thrusted", "squished", "crushed", "galloped", "chafed", "nuzzled", "caressed", "ground", "smudged", "smeared", "scrubbed", "lathered", "polished", "knead", "scraped", "stroked", "massaged", "buffed", "sandpapered", "brushed", "touched", "scrubbed", "smoothed", "wiped", "ransacked", "examined", "transferred", "throbbed", "reclined", "sprawled", "convulsed", "tottered", "juddered", "vibrated", "churned", "shuddered", "sloshed", "thrashed", "jerked", "jerked off", "chopped", "severed", "slit", "divided", "multiplied", "halved", "broke", "sundered", "separated", "ripped", "discontinued", "imprisoned", "entangled", "pinned", "restrained", "hooked", "pinched", "handcuffed", "hurled", "flipped", "tossed", "flung", "chucked", "heaved", "launched", "fired", "catapulted", "discharged", "lobbed", "pelted", "pegged", "ended", "terminated", "concluded", "fondled", "gloved", "palmed", "smoothed", "dabbed", "fingered", "pat", "twisted", "tilted", "rounded", "cranked", "switched", "swung", "twirled", "spun", "bended", "wielded", "handled", "employed", "adopted", "haunted", "adhered", "waddled", "splot", "desired", "lusted for", "yearned for", "observed", "stamped", "clumped", "flooded", "prowled", "bathed", "cleaned", "sold", "shampooed", "wheezed", "rugimated", "puzzled"]
      
      
      @State var randomLinesPositive = ["I got absolutely caca'd on!", "someone is dancing in the park!", "someone appreciated ur mom! xD haha", "I went to the craft fair! ;)", "the Eiffel tower has been relocated from Paris to Beijing again!", "I ripped my pants so hard I threw up! gnarly bro!"]
      
      @State var randomLinesNegative = ["my microwave dinner exploded!", "a stranger has broken into my house and pet my dog! not again!", "dang! my dog died!", "someone bombed my house!", "my pizza rolls caught on fire and burned down the entire neighborhood!"]
      
      
      func randomBodyPart() -> String {
          return bodyPartsList[Int.random(in: 0..<bodyPartsList.count)] }
      
      func randomAssaultAction() -> String{
          assaultActionList[Int.random(in: 0..<assaultActionList.count)] }
      
      var body: some Scene {
          WindowGroup {
              tabBarView(lines: $lines, people: $people, selectedIndex: $selectedIndex, randomLinesPositive: $randomLinesPositive, randomLinesNegative: $randomLinesNegative, bodyPartsList: $bodyPartsList, assaultActionList: $assaultActionList)
                  .environmentObject(person)
          }
      }
  }

