//
//  AboutView.swift
//  kwsapp
//
//  Created by Rayan Popat on 20/06/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("About KWS")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)

                        Image("about_us_image")
                            .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                            .aspectRatio(contentMode: .fit)

                        Text("Who We Are")
                        .font(.title2)
                        .fontWeight(.bold)

                        Text("We are Kenya Wildlife Services, a premier organization devoted to the protection, conservation, and management of Kenya's wildlife and biodiversity. We strive to maintain the balance between development and conservation, safeguarding our rich natural heritage for future generations.")

                        Text("Our Mission")
                        .font(.title2)
                        .fontWeight(.bold)

                        Text("Our mission is to sustainably conserve and manage Kenya's wildlife in its natural habitat, alongside promoting tourism and other wildlife-related enterprises for the economic development of our country. We provide interactive educational opportunities to foster appreciation and respect for the diversity and complexity of Kenya's ecosystems.")

//                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height)
                }
                .navigationBarTitle("About", displayMode: .inline)
            }
        }
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
