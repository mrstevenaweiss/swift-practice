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

    var body: some View {
        VStack {
            Text("Welcome to My First App")
                .foregroundColor(Color.green)
            Button(action: {
                print("pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("hello there!"),
                    message: Text("This is my first pop-up"),
                    dismissButton: .default(Text("Awesome!")))
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
