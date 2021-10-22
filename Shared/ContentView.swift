//
//  ContentView.swift
//  Shared
//
//  Created by Mac on 22/10/2021.
//

import SwiftUI

struct ContentView: View {
    //action when animation has been finish
     
    @State var endanimated:Bool = false
    
    var body: some View {
        
        ZStack{
            //home
            
            Home()
                .offset(y:endanimated ? 0 : getReat().height)
            SplashScreen(endanimated: $endanimated )
             
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
