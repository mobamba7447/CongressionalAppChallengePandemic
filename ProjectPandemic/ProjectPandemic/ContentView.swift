//
//  ContentView.swift
//  ProjectPandemic
//
//  Created by Jahan Khan on 7/16/20.
//  Copyright © 2020 Ryan Bascos Ashlyn Burrus Jahan Khan. All rights reserved.
//
 
import SwiftUI
 
struct ContentView: View {
    
    @State var currentPage = pages.docs
    
    var body: some View {
        
        ZStack {
            
            BarView(currentPage: $currentPage)
            
            VStack {
                Text("Project Pandemic")
                    .padding()
                Text("Copyright © 2020 Ryan Bascos, Ashlyn Burrus Jahan Khan. All rights reserved.")
                    .font(.caption)
                if currentPage == .docs {
                    Text("docs")
                }
                if currentPage == .convos {
                    Text("convos")
                }
                if currentPage == .profile {
                    Text("profile")
                }
            }
            
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
