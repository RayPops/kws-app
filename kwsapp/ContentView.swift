import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
            
            ParksView()
                .tabItem {
                    Image(systemName: "leaf")
                    Text("Parks")
                }
            
            ConservationView()
                .tabItem {
                    Image(systemName: "shield.lefthalf.fill")
                    Text("Conservation")
                }
            
            ScanTicketView()
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan Ticket")
                }
        }
        .accentColor(Color("TabButtonAccentColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ConservationView: View {
    var body: some View {
        Text("Conservations View")
    }
}

struct ScanTicketView: View {
    var body: some View {
        Text("Scan Ticket View")
    }
}

//struct ImageCarouselView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView(.horizontal, showsIndicators: true) {
//                LazyHStack(spacing: 10) {
//                    ForEach(1..<6) { index in
//                        Image("image\(index)")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: geometry.size.width, height: geometry.size.height)
//                            .clipped()
//                            .cornerRadius(10)
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}

struct ImageCarouselView: View {
    @State private var currentIndex: Int = 0

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack(spacing: 10) {
                        ForEach(0..<5, id: \.self) { index in
                            Image("image\(index+1)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                                .cornerRadius(40)
                                .id(index)

                        }
                    }
                    .padding()
                    .onAppear {
                        startTimer(scrollView: scrollView)
                    }
                }
            }
        }
    }

    func startTimer(scrollView: ScrollViewProxy) {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            if currentIndex < 4 {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
            withAnimation(.easeInOut(duration: 1.0)) {
                scrollView.scrollTo(currentIndex, anchor: .leading)
            }
        }
    }
}
