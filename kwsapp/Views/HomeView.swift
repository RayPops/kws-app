//
//  HomeView.swift
//  kwsapp
//
//  Created by Rayan Popat on 20/06/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                    .padding(.leading)
                
                Spacer()
                
                Button(action: {
                    // Search action
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("TabButtonAccentColor"))
                }
                
                Button(action: {
                    // Account action
                }) {
                    Image(systemName: "person")
                        .foregroundColor(Color("TabButtonAccentColor"))
                }
                .padding(.trailing)
            }
            
            GeometryReader { geometry in
                ZStack {
                    ImageCarouselView()
                        .padding(.top, 5.0)
                        .frame(height: geometry.size.height * 1)
                    
                    Text("Welcome to Kenya")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
