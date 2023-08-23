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
        Park(name: "Aberdare National Park", location: CLLocationCoordinate2D(latitude: -0.4167, longitude: 36.9500), description: "Aberdare National Park is a mountainous and forested park located in central Kenya. It features the Aberdare Mountain Range, which reaches heights of over 4,000 meters. The park is known for its scenic beauty, including waterfalls, deep valleys, and moorland. Aberdare is home to a variety of wildlife, including elephants, buffalos, leopards, hyenas, and several primate species. The park offers activities such as game drives, birdwatching, fishing in mountain streams, and even stays in unique tree lodges."),
        Park(name: "Amboseli National Park", location: CLLocationCoordinate2D(latitude: -2.6366, longitude: 37.2603), description: "Amboseli National Park is situated at the foothills of Mount Kilimanjaro, Africa's highest mountain, in southern Kenya. The park offers breathtaking views of the iconic snow-capped mountain, creating a stunning backdrop for wildlife photography. Amboseli is particularly famous for its large elephant herds, providing visitors with excellent opportunities to observe these majestic creatures up close. The park is also home to other wildlife species, such as lions, cheetahs, zebras, giraffes, and numerous bird species."),
        Park(name: "Maasai Mara", location: CLLocationCoordinate2D(latitude: -1.416667, longitude: 34.916667), description: "Maasai Mara is a world-renowned wildlife reserve located in southwestern Kenya. It is famous for its spectacular annual wildebeest migration, where millions of wildebeest, zebra, and gazelle cross the Mara River in search of fresh grazing. Maasai Mara is also known for its diverse wildlife population, including lions, cheetahs, elephants, giraffes, and various bird species. The vast savannah plains and picturesque landscapes make it a must-visit destination for nature and wildlife enthusiasts."),
        Park(name: "Arabuko Sokoke National Park", location: CLLocationCoordinate2D(latitude: -3.3186, longitude: 39.9134), description: "Arabuko Sokoke National Park is located on the coast of Kenya and is the largest coastal forest in East Africa. Home to a rich diversity of bird species, it's a prime destination for bird watchers. The park also boasts various rare and endangered mammals and is known for its unique forest landscapes."),
            
        Park(name: "Central Island National Park", location: CLLocationCoordinate2D(latitude: 3.5305, longitude: 36.1099), description: "Situated in the middle of Lake Turkana, Central Island National Park comprises of three active volcanoes. The park is also home to the world's largest crocodile population and offers a unique blend of aquatic and terrestrial wildlife experiences."),
        
        Park(name: "Chyulu Hills National Park", location: CLLocationCoordinate2D(latitude: -2.5375, longitude: 38.0833), description: "Chyulu Hills National Park offers a picturesque landscape of volcanic hills, deep caves, and dense forests. Located between Tsavo and Amboseli, it's a vital water catchment area with a diverse array of wildlife, including elephants, buffalos, and various bird species."),
        
        Park(name: "Kora National Park", location: CLLocationCoordinate2D(latitude: -0.9122, longitude: 39.8749), description: "Kora National Park is a wilderness landscape of acacia bushland and thorn trees. Once the home of the famous conservationist George Adamson, the park is rich in biodiversity and provides a sanctuary for several wild animal species."),
        
        Park(name: "Malka Mari National Park", location: CLLocationCoordinate2D(latitude: 4.184994, longitude: 40.771219), description: "Located in the northernmost part of Kenya, Malka Mari National Park features stunning landscapes of hills, valleys, and the Daua River. The park is home to various wildlife species and is an essential habitat for migratory birds."),
        
        Park(name: "Mount Elgon National Park", location: CLLocationCoordinate2D(latitude: 1.1400, longitude: 34.5500), description: "Mount Elgon National Park encompasses Mount Elgon, an extinct shield volcano. The park offers breathtaking landscapes, from vast caves to hot springs and waterfalls. It's a haven for hikers and nature enthusiasts alike."),
        
        Park(name: "Mount Longonot National Park", location: CLLocationCoordinate2D(latitude: -0.9144, longitude: 36.4788), description: "Dominating the Great Rift Valley, Mount Longonot is a stratovolcano that offers a challenging hiking experience with panoramic views of the surrounding landscape. The park's crater is a sight to behold, and the area is rich in birdlife."),
        
        Park(name: "Ol Donyo Sabuk National Park", location: CLLocationCoordinate2D(latitude: -1.2208, longitude: 37.1786), description: "Centered around the Ol Donyo Sabuk Mountain, this park boasts a montane landscape and is home to a significant buffalo population. The park is also a historical site with ties to the Kikuyu community."),
        
        Park(name: "Ruma National Park", location: CLLocationCoordinate2D(latitude: -0.6914, longitude: 34.2011), description: "Located in the Lambwe Valley, Ruma National Park is the only terrestrial park in Kenya's Nyanza Province. It provides a sanctuary for the endangered roan antelope and offers a diverse range of other wildlife species."),
        
        Park(name: "Saiwa Swamp National Park", location: CLLocationCoordinate2D(latitude: 1.1, longitude: 35.116667), description: "Saiwa Swamp National Park is Kenya's smallest national park, yet it holds a unique attraction: the Sitatunga antelope. The park's swampy habitat, replete with boardwalks and observation towers, provides a unique environment for bird watching and nature walks."),
        Park(name: "Nairobi National Park", location: CLLocationCoordinate2D(latitude: -1.3733, longitude: 36.8065), description: "Nairobi National Park is a unique wildlife sanctuary located just outside the bustling city of Nairobi, making it the only national park situated within a capital city worldwide. Despite its proximity to urban areas, the park boasts a diverse range of wildlife, including lions, rhinos, giraffes, zebras, buffalos, and various bird species. Nairobi National Park provides visitors with a chance to spot wildlife against the backdrop of a city skyline, offering a unique safari experience."),
        Park(name: "Mount Kenya National Park", location: CLLocationCoordinate2D(latitude: 0.1521, longitude: 37.3084), description: "Mount Kenya National Park is home to the second-highest mountain peak in Africa, Mount Kenya. The park showcases a stunning alpine landscape, with rugged peaks, glaciers, and pristine mountain lakes. It offers exceptional opportunities for hiking, mountaineering, and wildlife viewing. The park is inhabited by a rich variety of wildlife, including elephants, buffalos, leopards, hyenas, and several primate species. Exploring Mount Kenya National Park provides a unique adventure for nature lovers and outdoor enthusiasts."),
        Park(name: "Hell's Gate National Park", location: CLLocationCoordinate2D(latitude: -0.9946, longitude: 36.3918), description: "Hell's Gate National Park is a remarkable geothermal area located in the Great Rift Valley. The park's unique features include towering cliffs, deep gorges, and steaming hot springs. Visitors can enjoy various activities such as hiking, cycling, and rock climbing while admiring the park's dramatic scenery. Hell's Gate is also known for its diverse wildlife, including zebras, giraffes, gazelles, baboons, and over 100 bird species."),
        Park(name: "Tsavo East National Park", location: CLLocationCoordinate2D(latitude: -3.5355, longitude: 38.5425), description: "Tsavo East National Park is one of the oldest and largest national parks in Kenya, renowned for its expansive landscapes and abundant wildlife. The park is characterized by vast plains, scrubland, and the scenic Galana River. Visitors can spot a wide range of wildlife, including elephants, lions, leopards, giraffes, zebras, and numerous bird species. Tsavo East also offers the opportunity for exciting game drives, birdwatching, and guided walking safaris."),
        Park(name: "Tsavo West National Park", location: CLLocationCoordinate2D(latitude: -3.3928, longitude: 38.1563), description: "Tsavo West National Park is another vast wilderness area adjacent to Tsavo East, known for its diverse ecosystems and dramatic scenery. The park features volcanic hills, lava flows, natural springs, and the magnificent Mzima Springs, where visitors can observe hippos and crocodiles underwater. Tsavo West is home to a wide array of wildlife, including the \"red elephants\" due to the red dust prevalent in the area, as well as lions, cheetahs, buffalos, rhinos, and numerous bird species."),
        Park(name: "Samburu National Reserve", location: CLLocationCoordinate2D(latitude: 0.5974, longitude: 37.5359), description: "Samburu National Reserve is located in the northern part of Kenya and showcases a unique landscape of arid plains, acacia woodlands, and the Ewaso Ng'iro River. The reserve is famous for its \"Samburu Special Five,\" which consists of five rare wildlife species found in the region: the Grevy's zebra, Somali ostrich, reticulated giraffe, beisa oryx, and gerenuk. In addition to these unique species, visitors can also spot elephants, lions, leopards, cheetahs, and a wide variety of birdlife."),
        Park(name: "Ol Pejeta Conservancy", location: CLLocationCoordinate2D(latitude: 0.0166, longitude: 36.9166), description: "Ol Pejeta Conservancy is a private wildlife conservancy situated in central Kenya. It is home to a significant population of endangered black rhinos, as well as other wildlife species such as elephants, lions, cheetahs, giraffes, and chimpanzees. Ol Pejeta is committed to conservation and supports various initiatives, including anti-poaching efforts and community development projects. Visitors can enjoy game drives, guided walks, and even visit the chimpanzee sanctuary within the conservancy."),
        Park(name: "Meru National Park", location: CLLocationCoordinate2D(latitude: 0.1990, longitude: 38.4842), description: "Meru National Park is located in eastern Kenya and offers a tranquil and less-visited safari experience. The park is characterized by lush green landscapes, dense forests, and meandering rivers. Meru is known for its abundant birdlife and diverse wildlife population, including elephants, lions, leopards, zebras, giraffes, and numerous antelope species. The park also showcases breathtaking views of Mount Kenya and provides opportunities for game drives, nature walks, and birdwatching."),

        Park(name: "Lake Nakuru National Park", location: CLLocationCoordinate2D(latitude: -0.366667, longitude: 36.083333), description: "Lake Nakuru National Park, named after the picturesque Lake Nakuru located in the Rift Valley. The park is renowned for its large population of pink flamingos, which form a stunning pink carpet along the lake's shores. Besides flamingos, Lake Nakuru National Park is home to rhinos, lions, leopards, giraffes, zebras, and a diverse range of birdlife. The park's scenic landscapes and abundant wildlife make it a popular destination for nature enthusiasts and birdwatchers."),
        
        Park(name: "Sibiloi National Park", location: CLLocationCoordinate2D(latitude: 3.5864, longitude: 36.0725), description: "Located on the northeastern shore of Lake Turkana, Sibiloi National Park is known as the 'Cradle of Mankind' due to its significant archaeological sites. The park features a unique desert landscape and is home to a diverse range of wildlife, including the Nile crocodile and various bird species."),

        Park(name: "Arawale National Reserve", location: CLLocationCoordinate2D(latitude: -1.437778, longitude: 40.159722), description: "Situated in the northeastern region of Kenya, Arawale National Reserve is a haven for endangered species like the Hirola antelope. The reserve's semi-arid landscapes are home to a variety of wildlife and offer a serene wilderness experience."),

        Park(name: "Bisanadi National Reserve", location: CLLocationCoordinate2D(latitude: 0.3333, longitude: 38.8333), description: "Adjacent to Meru National Park, Bisanadi National Reserve provides an extension of the wilderness experience with its undisturbed landscapes. The reserve is rich in biodiversity and is a prime spot for birdwatching."),

        Park(name: "Boni National Reserve", location: CLLocationCoordinate2D(latitude: -1.7500, longitude: 41.0833), description: "Located near the coast, Boni National Reserve is a coastal forest reserve that is home to various rare and endemic species. Its dense forests and rich biodiversity make it a vital conservation area."),

        Park(name: "Buffalo Springs National Reserve", location: CLLocationCoordinate2D(latitude: 0.4667, longitude: 37.8500), description: "Adjacent to Samburu National Reserve, Buffalo Springs offers a similar landscape of arid plains and acacia woodlands. The reserve is home to a diverse range of wildlife, including the unique 'Samburu Special Five'."),

        Park(name: "Dodori National Reserve", location: CLLocationCoordinate2D(latitude: -2.1833, longitude: 41.0167), description: "Dodori National Reserve is a coastal reserve known for its mangrove forests and rich birdlife. The reserve is also home to various wildlife species, including the endangered Lamu antelope."),

        Park(name: "Kakamega Forest National Reserve", location: CLLocationCoordinate2D(latitude: 0.3250, longitude: 34.7500), description: "Kakamega Forest is a tropical rainforest offering a unique ecosystem that stands out in Kenya. It's a paradise for bird lovers, with over 400 species, and also boasts a rich diversity of butterflies and primates."),

        Park(name: "Kisumu Impala Sanctuary", location: CLLocationCoordinate2D(latitude: -0.1033, longitude: 34.7689), description: "Situated near the shores of Lake Victoria, Kisumu Impala Sanctuary provides a safe haven for impalas and offers a serene environment for nature walks and bird watching."),

        Park(name: "Lake Bogoria National Reserve", location: CLLocationCoordinate2D(latitude: 0.3833, longitude: 36.0833), description: "Famous for its geothermal hot springs and a large population of flamingos, Lake Bogoria National Reserve offers a mesmerizing landscape of the lake against the backdrop of the Laikipia Escarpment."),

        Park(name: "Mwaluganje Elephant Sanctuary", location: CLLocationCoordinate2D(latitude: -4.2833, longitude: 39.2667), description: "Dedicated to the conservation of elephants, Mwaluganje Elephant Sanctuary offers a unique experience to observe these majestic creatures in their natural habitat. The sanctuary also plays a significant role in community-based conservation efforts."),
        
        Park(name: "Mwea National Reserve", location: CLLocationCoordinate2D(latitude: -0.6672, longitude: 37.6522), description: "Located in the eastern part of Kenya, Mwea National Reserve offers a mix of woodlands and wetlands. The reserve is home to a variety of wildlife, including the endangered sitatunga antelope and a plethora of bird species, making it a birdwatcher's paradise."),

        Park(name: "Mwingi National Reserve", location: CLLocationCoordinate2D(latitude: -0.6833, longitude: 38.1333), description: "Mwingi National Reserve provides a serene wilderness experience with its rugged landscapes and diverse wildlife. The reserve is an essential corridor for elephants and is known for its scenic beauty."),

        Park(name: "Rahole National Reserve", location: CLLocationCoordinate2D(latitude: -1.0833, longitude: 40.2500), description: "Situated along the Tana River, Rahole National Reserve offers a unique ecosystem of riverine forests and dry woodlands. The reserve is home to various wildlife species and is an important conservation area for primates."),

        Park(name: "Rimoi National Reserve", location: CLLocationCoordinate2D(latitude: 1.5708, longitude: 35.8639), description: "Rimoi National Reserve is a lesser-known gem that provides a tranquil wilderness experience. The reserve's landscapes range from plains to hilly terrains and are home to a variety of wildlife, including elephants."),

        Park(name: "Shimba Hills National Reserve", location: CLLocationCoordinate2D(latitude: -4.2967, longitude: 39.3844), description: "Shimba Hills National Reserve offers a blend of coastal rainforest, woodland, and grassland habitats. The reserve is home to the rare sable antelope and boasts stunning views of the Indian Ocean. It's a vital area for plant biodiversity and birdlife."),

        Park(name: "Tana River Primate Reserve", location: CLLocationCoordinate2D(latitude: -2.3333, longitude: 40.0000), description: "Dedicated to the conservation of primates, Tana River Primate Reserve houses endangered species like the Tana River red colobus and the crested mangabey. The reserve's riverine forests provide a unique habitat for these primates."),

        Park(name: "Witu Forest Reserve (Utwani Forest Reserve)", location: CLLocationCoordinate2D(latitude: -2.2833, longitude: 40.9000), description: "Also known as Utwani Forest Reserve, Witu Forest Reserve is a coastal forest reserve that plays a vital role in conserving the unique coastal forest ecosystem. The reserve is home to various bird species and provides a serene environment for nature enthusiasts."),

        Park(name: "Kisite-Mpunguti Marine National Park", location: CLLocationCoordinate2D(latitude: -4.6758, longitude: 39.5061), description: "Located off the south coast of Kenya, Kisite-Mpunguti Marine National Park offers a vibrant marine ecosystem with coral reefs, marine mammals, and a plethora of fish species. It's a paradise for snorkeling and diving enthusiasts."),

        Park(name: "Kiunga Marine National Reserve", location: CLLocationCoordinate2D(latitude: -2.0175, longitude: 41.2797), description: "Kiunga Marine National Reserve is a coastal marine reserve known for its rich biodiversity. The reserve's coral reefs are home to various marine species, including turtles, and provide a unique underwater experience."),
        
        Park(name: "Malindi Marine National Park", location: CLLocationCoordinate2D(latitude: -3.2209, longitude: 40.1169), description: "Situated off the coast of Malindi, this marine national park boasts vibrant coral reefs, seagrass beds, and mangroves. It's a sanctuary for marine life, including turtles, dolphins, and various fish species, making it a prime destination for snorkeling and diving."),

        Park(name: "Mombasa Marine National Park and Reserve", location: CLLocationCoordinate2D(latitude: -4.0423, longitude: 39.6682), description: "Located off the coast of Mombasa, this marine park and reserve is a haven for marine biodiversity. With its clear turquoise waters, colorful coral gardens, and diverse marine life, it offers a unique underwater experience for both divers and snorkelers."),

        Park(name: "Watamu Marine National Park", location: CLLocationCoordinate2D(latitude: -3.3546, longitude: 40.0200), description: "Nestled off the coast of Watamu, this marine national park is renowned for its pristine coral reefs and diverse marine life. Home to turtles, manta rays, and a plethora of fish species, it's a paradise for underwater enthusiasts and conservationists alike.")
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



let national_parks = ["Aberdare National Park", "Amboseli National Park", "Arabuko Sokoke National Park", "Central Island National Park", "Chyulu Hills National Park", "Hell's Gate National Park", "Kora National Park", "Lake Nakuru National Park", "Malka Mari National Park", "Maasai Mara National Park", "Meru National Park", "Mount Elgon National Park", "Mount Kenya National Park", "Mount Longonot National Park", "Nairobi National Park", "Ol Donyo Sabuk National Park", "Ruma National Park", "Saiwa Swamp National Park", "Sibiloi National Park", "Tsavo East National Park", "Tsavo West National Park"]
let national_reserves = ["Arawale National Reserve", "Bisanadi National Reserve", "Boni National Reserve", "Buffalo Springs National Reserve", "Dodori National Reserve", "Kakamega Forest National Reserve", "Kisumu Impala Sanctuary", "Lake Bogoria National Reserve", "Mwaluganje Elephant Sanctuary", "Mwea National Reserve", "Mwingi National Reserve", "Rahole National Reserve", "Rimoi National Reserve", "Samburu National Reserve", "Shimba Hills National Reserve", "Tana River Primate Reserve", "Witu Forest Reserve (Utwani Forest Reserve)"]
let marine_parks_and_reserves = ["Kisite-Mpunguti Marine National Park", "Kiunga Marine National Reserve", "Malindi Marine National Park", "Mombasa Marine National Park and Reserve", "Watamu Marine National Park"]

let darkGreen = Color(red: 0.00, green: 0.2, blue: 0.03)
let navyBlue = Color(red: 0/255, green: 0/255, blue: 102/255)

struct MapAnnotationView: View {
    @State var isShowingDetail = false
    let park: Park
    
    // Determine the type of park based on its name
    var parkType: String {
        if national_parks.contains(park.name) {
            return "NationalPark"
        } else if national_reserves.contains(park.name) {
            return "NationalReserve"
        } else if marine_parks_and_reserves.contains(park.name) {
            return "MarineReserve"
        } else {
            return "Unknown"
        }
    }
    
    // Determine the image and color based on the park type
    var parkImage: String {
        switch parkType {
        case "NationalPark":
            return "tent.circle.fill"
        case "NationalReserve":
            return "tree.circle.fill"
        case "MarineReserve":
            return "drop.circle.fill"
        default:
            return "figure.walk.circle.fill"
        }
    }
    
    var parkColor: Color {
        switch parkType {
        case "NationalPark":
            return Color("ParkIconColor")
        case "NationalReserve":
            return darkGreen
        case "MarineReserve":
            return navyBlue
        default:
            return Color("ParkIconColor")
        }
    }
    
    var body: some View {
        Button(action: {
            self.isShowingDetail.toggle()
        }) {
            Image(systemName: parkImage)
                .foregroundColor(parkColor)
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
