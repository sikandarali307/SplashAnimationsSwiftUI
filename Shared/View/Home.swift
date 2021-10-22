//
//  SwiftUIView.swift
//  SplashAnimationsSwiftUI (iOS)
//
//  Created by Mac on 22/10/2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView
        {
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 20){
                    ForEach(1...7,id: \.self){
                        index in
                        Image("Pic\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getReat().width - 30, height: 220)
                            .cornerRadius(30)
                    }
                }
                .padding(15)
            }
            .navigationTitle("Trending Pictures")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
