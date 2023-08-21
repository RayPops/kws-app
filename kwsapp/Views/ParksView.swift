//
//  ParksView.swift
//  kwsapp
//
//  Created by Rayan Popat on 20/06/2023.
//

import SwiftUI
import MapKit

struct Park: Identifiable {
    let id = UUID()
    let name: String
    let location: CLLocationCoordinate2D
    var description: String
}


struct ParksView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -1.2921, longitude: 36.8219),
        span: MKCoordinateSpan(latitudeDelta: 7.0, longitudeDelta: 7.0)
    )
    
    let parks: [Park] = [
        Park(name: "Maasai Mara", location: CLLocationCoordinate2D(latitude: -1.416667, longitude: 34.916667), description: "Maasai Mara is a world-renowned wildlife reserve located in southwestern Kenya. It is famous for its spectacular annual wildebeest migration, where millions of wildebeest, zebra, and gazelle cross the Mara River in search of fresh grazing. Maasai Mara is also known for its diverse wildlife population, including lions, cheetahs, elephants, giraffes, and various bird species. The vast savannah plains and picturesque landscapes make it a must-visit destination for nature and wildlife enthusiasts."),
        Park(name: "Amboseli National Park", location: CLLocationCoordinate2D(latitude: -2.6366, longitude: 37.2603), description: "Amboseli National Park is situated at the foothills of Mount Kilimanjaro, Africa's highest mountain, in southern Kenya. The park offers breathtaking views of the iconic snow-capped mountain, creating a stunning backdrop for wildlife photography. Amboseli is particularly famous for its large elephant herds, providing visitors with excellent opportunities to observe these majestic creatures up close. The park is also home to other wildlife species, such as lions, cheetahs, zebras, giraffes, and numerous bird species."),
        Park(name: "Nairobi National Park", location: CLLocationCoordinate2D(latitude: -1.3733, longitude: 36.8065), description: "Nairobi National Park is a unique wildlife sanctuary located just outside the bustling city of Nairobi, making it the only national park situated within a capital city worldwide. Despite its proximity to urban areas, the park boasts a diverse range of wildlife, including lions, rhinos, giraffes, zebras, buffalos, and various bird species. Nairobi National Park provides visitors with a chance to spot wildlife against the backdrop of a city skyline, offering a unique safari experience."),
        Park(name: "Mount Kenya National Park", location: CLLocationCoordinate2D(latitude: 0.1521, longitude: 37.3084), description: "Mount Kenya National Park is home to the second-highest mountain peak in Africa, Mount Kenya. The park showcases a stunning alpine landscape, with rugged peaks, glaciers, and pristine mountain lakes. It offers exceptional opportunities for hiking, mountaineering, and wildlife viewing. The park is inhabited by a rich variety of wildlife, including elephants, buffalos, leopards, hyenas, and several primate species. Exploring Mount Kenya National Park provides a unique adventure for nature lovers and outdoor enthusiasts."),
        Park(name: "Hell's Gate National Park", location: CLLocationCoordinate2D(latitude: -0.9946, longitude: 36.3918), description: "Hell's Gate National Park is a remarkable geothermal area located in the Great Rift Valley. The park's unique features include towering cliffs, deep gorges, and steaming hot springs. Visitors can enjoy various activities such as hiking, cycling, and rock climbing while admiring the park's dramatic scenery. Hell's Gate is also known for its diverse wildlife, including zebras, giraffes, gazelles, baboons, and over 100 bird species."),
        Park(name: "Tsavo East National Park", location: CLLocationCoordinate2D(latitude: -3.5355, longitude: 38.5425), description: "Tsavo East National Park is one of the oldest and largest national parks in Kenya, renowned for its expansive landscapes and abundant wildlife. The park is characterized by vast plains, scrubland, and the scenic Galana River. Visitors can spot a wide range of wildlife, including elephants, lions, leopards, giraffes, zebras, and numerous bird species. Tsavo East also offers the opportunity for exciting game drives, birdwatching, and guided walking safaris."),
        Park(name: "Tsavo West National Park", location: CLLocationCoordinate2D(latitude: -3.3928, longitude: 38.1563), description: "Tsavo West National Park is another vast wilderness area adjacent to Tsavo East, known for its diverse ecosystems and dramatic scenery. The park features volcanic hills, lava flows, natural springs, and the magnificent Mzima Springs, where visitors can observe hippos and crocodiles underwater. Tsavo West is home to a wide array of wildlife, including the \"red elephants\" due to the red dust prevalent in the area, as well as lions, cheetahs, buffalos, rhinos, and numerous bird species."),
        Park(name: "Samburu National Reserve", location: CLLocationCoordinate2D(latitude: 0.5974, longitude: 37.5359), description: "Samburu National Reserve is located in the northern part of Kenya and showcases a unique landscape of arid plains, acacia woodlands, and the Ewaso Ng'iro River. The reserve is famous for its \"Samburu Special Five,\" which consists of five rare wildlife species found in the region: the Grevy's zebra, Somali ostrich, reticulated giraffe, beisa oryx, and gerenuk. In addition to these unique species, visitors can also spot elephants, lions, leopards, cheetahs, and a wide variety of birdlife."),
        Park(name: "Ol Pejeta Conservancy", location: CLLocationCoordinate2D(latitude: 0.0166, longitude: 36.9166), description: "Ol Pejeta Conservancy is a private wildlife conservancy situated in central Kenya. It is home to a significant population of endangered black rhinos, as well as other wildlife species such as elephants, lions, cheetahs, giraffes, and chimpanzees. Ol Pejeta is committed to conservation and supports various initiatives, including anti-poaching efforts and community development projects. Visitors can enjoy game drives, guided walks, and even visit the chimpanzee sanctuary within the conservancy."),
        Park(name: "Meru National Park", location: CLLocationCoordinate2D(latitude: 0.1990, longitude: 38.4842), description: "Meru National Park is located in eastern Kenya and offers a tranquil and less-visited safari experience. The park is characterized by lush green landscapes, dense forests, and meandering rivers. Meru is known for its abundant birdlife and diverse wildlife population, including elephants, lions, leopards, zebras, giraffes, and numerous antelope species. The park also showcases breathtaking views of Mount Kenya and provides opportunities for game drives, nature walks, and birdwatching."),
        Park(name: "Aberdare National Park", location: CLLocationCoordinate2D(latitude: -0.4167, longitude: 36.9500), description: "Aberdare National Park is a mountainous and forested park located in central Kenya. It features the Aberdare Mountain Range, which reaches heights of over 4,000 meters. The park is known for its scenic beauty, including waterfalls, deep valleys, and moorland. Aberdare is home to a variety of wildlife, including elephants, buffalos, leopards, hyenas, and several primate species. The park offers activities such as game drives, birdwatching, fishing in mountain streams, and even stays in unique tree lodges."),
        Park(name: "Nakuru", location: CLLocationCoordinate2D(latitude: -0.366667, longitude: 36.083333), description: "Nakuru refers to Lake Nakuru National Park, named after the picturesque Lake Nakuru located in the Rift Valley. The park is renowned for its large population of pink flamingos, which form a stunning pink carpet along the lake's shores. Besides flamingos, Lake Nakuru National Park is home to rhinos, lions, leopards, giraffes, zebras, and a diverse range of birdlife. The park's scenic landscapes and abundant wildlife make it a popular destination for nature enthusiasts and birdwatchers.")
    ]


    var body: some View {
        Map(coordinateRegion: $region, annotationItems: parks) { park in
            MapAnnotation(coordinate: park.location) {
                MapAnnotationView(park: park)
            }
        }
        .navigationBarTitle("Parks", displayMode: .inline)
    }
}

struct MapAnnotationView: View {
    @State var isShowingDetail = false
    let park: Park
    
    var body: some View {
        Button(action: {
            self.isShowingDetail.toggle()
        }) {
            Image(systemName: "tent.circle.fill")
                .foregroundColor(Color("ParkIconColor"))
                .imageScale(.large)
                .onTapGesture {
                    self.isShowingDetail = true
                }
        }
        .sheet(isPresented: $isShowingDetail, content: {
            ParkDetailView(park: park)
        })
    }
}

struct ParkDetailView: View {
    let park: Park

    var body: some View {
        VStack {
            Text(park.name)
                .font(.largeTitle).bold()
                .multilineTextAlignment(.center)
                .padding()

            Text("Location: \(park.location.latitude), \(park.location.longitude)")
                .font(.title2)
                .multilineTextAlignment(.leading)
                .padding()
            
            Text("Description:")
            .font(.title2)
            .fontWeight(.bold)

            Text(park.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
                .lineSpacing(8) // Add line spacing for better readability
        }
        .padding() // Add overall padding to the VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Expand the view to fill available space
        .edgesIgnoringSafeArea(.all) // Ignore safe area to occupy full screen
    }

}


struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
        ParksView()
    }
}
