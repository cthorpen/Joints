//
//  ContentView.swift
//  Joints
//
//  Created by Cole Thorpen on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .cornerRadius(15)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



