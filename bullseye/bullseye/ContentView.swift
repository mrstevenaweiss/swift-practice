//
//  ContentView.swift
//  bullseye
//
//  Created by steven weiss on 11/22/19.
//  Copyright © 2019 steven weiss. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
//    @State var startGameOver: Bool = false

    var body: some View {
        
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bulleyes as close as you can to:")
                Text("100")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            // Button row
            Button(action: {
                print("pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                var roundedValue : Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello there!"),
                             message: Text("The slider's value is \(roundedValue)"),
                             dismissButton: .default(Text("Awesome!")))
                }
            Spacer()
            
            // Score row
            HStack {
                Button(action:{ print("Start Over") }) {
                    Text("Start Over!")
                }
                Spacer()
                Text("Score")
                Text("99999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: { print("Info") }){
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
