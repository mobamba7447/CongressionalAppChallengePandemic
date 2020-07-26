//
//  BarView.swift
//  ProjectPandemic
//
//  Created by Ryan Bascos on 7/25/20.
//  Copyright © 2020 Ryan Bascos Ashlyn Burrus Jahan Khan. All rights reserved.
//
 
import SwiftUI
 
enum pages: CaseIterable {
    case docs, convos, profile
}
 
struct BarView: View {
    
    @Binding var currentPage: pages
    
    var body: some View {
        
        VStack {
            Spacer()
            
            HStack {
                
                Spacer()
                Button(action: {
                    self.currentPage = .docs
                }) {
                    Text("docs")
                }
                Spacer()
                Button(action: {
                    self.currentPage = .convos
                }) {
                    Text("convos")
                }
                Spacer()
                Button(action: {
                    self.currentPage = .profile
                }) {
                    Text("profile")
                }
                Spacer()
                
            }
            .padding(.bottom, 30)
            
        }
        
    }
}
 
struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(currentPage: Binding.constant(.docs))
    }
}
