//
//  ConservationView.swift
//  kwsapp
//
//  Created by Rayan Popat on 21/06/2023.
//

import SwiftUI

struct Conservation: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

struct ConservationView: View {
    let conservations: [Conservation] = [
        Conservation(imageName:"lion_cub", title: "Adopt a Cub", description: "Support our lion conservation efforts by adopting a lion cub."),
        Conservation(imageName: "elephant_calf", title: "Save the Elephants", description: "Contribute to the conservation of elephants and help protect them from poaching."),
        Conservation(imageName: "rhino_calf", title: "Protect the Rhinos", description: "Join us in our mission to safeguard rhinos and their habitats."),
        Conservation(imageName: "cheetah_cub", title: "Cheetah Conservation", description: "Support our efforts to protect and conserve cheetah populations."),
        Conservation(imageName: "giraffe_calf", title: "Preserve Giraffes", description: "Help us conserve giraffes and their shrinking habitats."),
        Conservation(imageName: "zebra_foal", title: "Zebra Conservation", description: "Contribute to the conservation of zebras and their unique ecosystems.")
    ]
    
    @State private var selectedConservation: Conservation?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: createColumns(), spacing: 20) {
                    ForEach(conservations) { conservation in
                        ConservationTile(conservation: conservation)
                            .onTapGesture {
                                selectedConservation = conservation
                            }
                    }
                }
                .padding()
                .sheet(item: $selectedConservation) { conservation in
                    ConservationDetail(conservation: conservation)
                }
            }
            .navigationBarTitle("Conservation Efforts")
        }
    }
    
    private func createColumns() -> [GridItem] {
        let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        return columns
    }
}

struct ConservationTile: View {
    let conservation: Conservation
    
    var body: some View {
        VStack {
            Image(conservation.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 175, height: 150)
                .cornerRadius(10)
                .clipped()
            
            Text(conservation.title)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
    }
}

struct ConservationDetail: View {
    let conservation: Conservation
    
    var body: some View {
        VStack {
            Image(conservation.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
            
            Text(conservation.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(conservation.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ConservationView_Previews: PreviewProvider {
    static var previews: some View {
        ConservationView()
    }
}
