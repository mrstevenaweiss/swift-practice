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

    struct LableStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .font(Font.custom("Arial Rounded MT Bold", size:18))
        }
    }
    
    struct ValueStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .font(Font.custom("Arial Rounded MT Bold", size:24))
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bulleyes as close as you can to :").modifier(LableStyle())
                Text("\(self.target)").modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1").modifier(LableStyle())
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100").modifier(LableStyle())
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
                return Alert(title: Text( alertTitle() ),
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
                Button(action:{
                    self.startOver()
                }) {
                    Text("Start Over!")
                }
                Spacer()
                Text("Score").modifier(LableStyle())
                Text("\(totalScore)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LableStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                Button(action: { print("Info") }){
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }.background(Image("Background"), alignment: .center)
//        func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background : View
        
        
    }
    func pointsForCurrentRound() -> Int {
        return abs(Int(self.sliderValue.rounded()) - self.target)
    }
    
    func alertTitle() -> String {
        let difference = abs(Int(self.sliderValue.rounded()) - target)
        let title : String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference <= 10 {
            title = "Not bad"
        } else {
            title = "You suck"
        }
        return title
    }
    
    func startOver() {
        totalScore = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
