//
//  CreateCharacter.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/24/22.
//

import SwiftUI

struct CreateCharacter: View {
    
    @Binding var selectedIndex: Int

    @EnvironmentObject var person: Person

    var body: some View {
        ZStack {
            
            //Color.blue
            VStack {
                Spacer()
        
                Text("Create Your Character")
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
                    person.needsCreation = false
                }, label: {
                    Text("Create Character")
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

struct CreateCharacterView_Previews: PreviewProvider {
    @State static var selectedIndex = 0

    
    static var previews: some View {
        CreateCharacter(selectedIndex: $selectedIndex)
            .environmentObject(Person())
    }
}
