//
//  randomEvents.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

func randomChance(probability: Double) -> Bool {
    
    if Double.random(in: 0.0...100.0) < probability {
        return true
    } else {
        return false
    }
        
   
}

func export() -> Void {
    @Binding var lines: [(text: String, type: String)]

    
}

func randomAssaultAction() -> String {
@State var assaultActionList = ["inverted", "creamed", "fucked", "decimated", "annihilated", "scraped", "tickled", "pleasured", "removed", "ate", "licked", "blended and drank", "shoved my dick into", "passionately licked", "took out a gun and shot", "bombed", "painted", "severed", "split", "ruptured", "exploded", "shit on", "pissed on", "cummed on", "sawed off", "cracked", "insulted", "poured acid on", "barbecued", "microwaved", "sat and farted on", "cremated", "eliminated", "discombobulated", "grazed", "drop-kicked", "sniped", "murdered", "rushed", "bombarded", "barraged", "molested", "clobbered", "hammered", "beat", "battled", "raided", "ruptured", "smashed", "shattered", "fractured", "splintered", "pulverized", "tore", "snapped", "busted", "damaged", "nudged", "tapped", "jostled", "jarred", "knocked", "jolted", "thumped", "butted", "clattered", "whacked", "slammed", "distorted", "mutated", "warped", "evolved", "reformed", "whooped", "whipped", "battered", "cleaved", "chopped", "chipped", "sliced", "snipped", "divided", "pruned", "trimmed", "axed", "slashed", "carved", "dissected", "pierced", "invaded", "infiltrated", "plunged", "toppled", "exposed", "excavated", "drilled", "hollowed out", "gouged", "tunneled through", "exhumed", "battled", "tussled", "wrestled", "scuffled", "dueled", "brawled", "jousted", "sparred", "clashed with", "grappled", "scrapped", "quarreled", "crammed", "molded", "re-arranged", "jammed", "packed", "compressed", "cobbled", "improved", "served", "decked", "grasped", "pounded",  "bolster", "flogged", "swatted", "reaped", "extracted", "inherited", "dispensed", "disposed of", "sacrificed", "conquered", "took", "stole", "snatched", "seized", "apprehended", "claimed", "wrenched", "plucked", "concealed", "buried", "squeezed", "bashed", "smacked", "slapped", "slammed", "punched", "clapped", "bumped", "poked", "walloped", "smoked", "zipped", "cemented", "glued", "fused", "booted", "punted", "withdrew", "deposited", "vacated", "thinned out", "shrunk", "expanded", "hoisted", "mounted", "evaporated", "deposited", "lodged", "dropped", "tampered with", "diminished", "jiggled", "juggled", "propelled", "spread", "unfolded", "peeled", "gaped", "unrolled", "displayed", "released", "got rid of", "shifted", "jarred", "nudged", "popped out", "displaced", "tapped", "dabbled with", "flirted with", "capered with", "played with", "toyed with", "gathered", "collected", "harvested", "vaccinated", "glared menacingly at", "shoved", "nudged", "strained", "thrusted", "squished", "crushed", "galloped", "chafed", "nuzzled", "caressed", "ground", "smudged", "smeared", "scrubbed", "lathered", "polished", "knead", "scraped", "stroked", "massaged", "buffed", "sandpapered", "brushed", "touched", "scrubbed", "smoothed", "wiped", "ransacked", "examined", "transferred", "throbbed", "reclined", "sprawled", "convulsed", "tottered", "juddered", "vibrated", "churned", "shuddered", "sloshed", "thrashed", "jerked", "jerked off", "chopped", "severed", "slit", "divided", "multiplied", "halved", "broke", "sundered", "separated", "ripped", "discontinued", "imprisoned", "entangled", "pinned", "restrained", "hooked", "pinched", "handcuffed", "hurled", "flipped", "tossed", "flung", "chucked", "heaved", "launched", "fired", "catapulted", "discharged", "lobbed", "pelted", "pegged", "ended", "terminated", "concluded", "fondled", "gloved", "palmed", "smoothed", "dabbed", "fingered", "pat", "twisted", "tilted", "rounded", "cranked", "switched", "swung", "twirled", "spun", "bended", "wielded", "handled", "employed", "adopted", "haunted", "adhered", "waddled", "splot", "desired", "lusted for", "yearned for", "observed", "stamped", "clumped", "flooded", "prowled", "bathed", "cleaned", "sold", "shampooed", "wheezed", "rugimated", "puzzled", "beat the shit out of", "trampled", "took a crowbar to", "t-bagged", "farted on", "presented my anus to"]
    
    return assaultActionList[Int.random(in: 0..<assaultActionList.count)]
}

func randomBodyPart() -> String {
    @State var bodyPartsList = ["head", "shoulders", "knees", "toes", "feet", "chest", "neck", "ears", "eyes", "nose", "mouth", "torso", "belly", "chest", "arms", "legs", "penis", "vagina", "foreskin", "clitoris", "anus", "back", "ballsack", "fingers", "eyelid", "coccyx", "ovaries", "tiddies", "brain", "lungs", "internal arteries", "leg hair", "hair", "testes", "butt cheeks", "fat rolls", "armpit", "weenis", "fingernails", "throat", "tongue", "larynx", "pelvis", "large intestine", "chin", "ankle", "beard", "calf", "cheek", "earlobe", "eyebrow", "eyelash", "face", "forearm", "forehead", "heel", "gums", "teeth", "jaw", "knee", "knuckle", "mustache", "bladder", "blood", "bones", "buttocks", "cervix", "colon", "fallopian tubes", "follicles", "groin", "gullet", "hamstring", "heart", "jugular", "kidney", "labia majora", "labia minora", "loin", "lung", "mons pubis", "navel", "nerves", "nipples", "left nipple", "right nipple", "nostrils", "pancreas", "pubes", "rectum", "ribcage", "scalp", "scrotum", "shin", "spleen", "tendon", "tonsils", "umbilical cord", "urethra", "vulva", "windpipe", "womb", "wrist", "butt-crack", "esophagus", "anal canal", "trachea", "muscles of breathing", "placenta", "fetus", "embryo", "prostate", "seminal vesicles", "pituitary gland", "adrenal glands", "arteries", "capillaries", "veins", "bone marrow", "thymus", "pants", "shirt", "underwear", "tonsils", "spinal cord", "ventricle system", "cornea", "iris", "retinas", "eardrum", "taste buds", "body"]
    return bodyPartsList[Int.random(in: 0..<bodyPartsList.count)]

}
