//
//  ContentView.swift
//  ProjectPandemic
//
//  Created by Jahan Khan on 7/16/20.
//  Copyright © 2020 Ryan Bascos, Ashlyn Burrus Jahan Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Project Pandemic")
                .padding()
            Text("Copyright © 2020 Ryan Bascos, Ashlyn Burrus Jahan Khan. All rights reserved.")
                .font(.caption)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
