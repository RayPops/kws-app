import SwiftUI

struct AboutView: View {
    var body: some View {
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

                    Text("We are Kenya Wildlife Services (KWS), a premier organization devoted to the protection, conservation, and management of Kenya's wildlife and biodiversity. We strive to maintain the balance between development and conservation, safeguarding our rich natural heritage for future generations.")

                    Text("Our History")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Established in 1989, KWS has been at the forefront of preserving wildlife and biodiversity in Kenya for over three decades. From the majestic lions of the Maasai Mara to the elusive black rhinos of Nairobi National Park, our commitment to conservation has protected these species and many more for generations to come.")

                    Text("Our Mission")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Our mission is to sustainably conserve and manage Kenya's wildlife in its natural habitat, alongside promoting tourism and other wildlife-related enterprises for the economic development of our country. We provide interactive educational opportunities to foster appreciation and respect for the diversity and complexity of Kenya's ecosystems.")

                    Text("Our Achievements")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Over the years, we've initiated and participated in numerous successful conservation projects, including efforts to combat poaching, habitat restoration initiatives, and community education programs. We've also been recognized globally for our commitment to environmental stewardship.")

                }
                .padding()
            }
            .navigationBarTitle("About", displayMode: .inline)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
