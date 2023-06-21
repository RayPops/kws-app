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
            
            PurchaseTicketView()
                .tabItem {
                    Image(systemName: "ticket")
                    Text("Buy Tickets")
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

struct ImageCarouselView: View {
    @State private var currentIndex: Int = 0
    @State private var isReversed: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack(spacing: 1) {
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
                    //.padding()
                    .onAppear {
                        startTimer(scrollView: scrollView)
                    }
                }
            }
        }
    }

    func startTimer(scrollView: ScrollViewProxy) {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            if currentIndex == 4 {
                isReversed = true
            } else if currentIndex == 0 {
                isReversed = false
            }
            
            currentIndex = isReversed ? currentIndex - 1 : currentIndex + 1
            
            withAnimation(.easeInOut(duration: 1.0)) {
                scrollView.scrollTo(currentIndex, anchor: .leading)
            }
        }
    }
}

