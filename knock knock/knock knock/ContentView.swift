//
//  ContentView.swift
//  knock knock
//
//  Created by steven weiss on 11/29/19.
//  Copyright © 2019 steven weiss. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            // your action here
            self.showingAlert = true
        })
        {
            Text("Knock Knock")
        }
        .alert(isPresented: $showingAlert) {
        Alert(title: Text("Who's there?!"),
              message: Text("hatch you"),
              dismissButton: .default(Text("Bless you!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
