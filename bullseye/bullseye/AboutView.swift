//
//  AboutView.swift
//  bullseye
//
//  Created by steven weiss on 12/8/19.
//  Copyright © 2019 steven weiss. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    VStack {
      Text("🎯 Bullseye")
      Text("This is Bullseye, the game where you drag and win points and earn fame")
      Text("Place the slider as close to the targert as possible")
      Text("Enjoy")
    }.navigationBarTitle("About Bullseye")
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView().previewLayout(.fixed(width: 896, height: 414))
  }
}
