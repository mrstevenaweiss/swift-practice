//
//  ContentView.swift
//  bullseye
//
//  Created by steven weiss on 11/22/19.
//  Copyright © 2019 steven weiss. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var round = 1

    var body: some View {
        
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bulleyes as close as you can to :")
                Text("\(self.target)")
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
                let roundedValue = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello there!"),
                             message: Text("The slider's value is \(roundedValue).\n" + "You scored \(self.pointsForCurrentRound()) points this round."
                    ),
                             dismissButton: .default(Text("Awesome!")) {
                                self.totalScore = self.totalScore + self.pointsForCurrentRound()
                                self.target = Int.random(in: 1...100)
                                self.round = self.round + 1
                    })
                }
            Spacer()
            
            // Score row
            HStack {
                Button(action:{ print("Start Over") }) {
                    Text("Start Over!")
                }
                Spacer()
                Text("Score")
                Text("\(totalScore)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: { print("Info") }){
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
    }
    func pointsForCurrentRound() -> Int {
        return abs(Int(self.sliderValue.rounded()) - self.target)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
