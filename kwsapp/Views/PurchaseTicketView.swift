import SwiftUI

struct PurchaseTicketView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PurchaseTicketView()
        }
    }
}

struct ParkTicketed: Identifiable {
    let id: Int
    let name: String
    let localPrice: Double
    let foreignPrice: Double
}

struct Ticket: Identifiable {
    let id = UUID()
    let park: ParkTicketed
    let days: Int
    let isLocal: Bool
    var price: Double {
        return (isLocal ? park.localPrice : park.foreignPrice) * Double(days)
    }
}

struct PurchaseTicketView: View {
    @State var cart: [Ticket] = []
    var parks: [ParkTicketed] = [
        ParkTicketed(id: 0, name: "Tsavo East National Park", localPrice: 10, foreignPrice: 70),
        ParkTicketed(id: 1, name: "Watamu Marine Park", localPrice: 10, foreignPrice: 20),
        ParkTicketed(id: 2, name: "Nairobi National Park", localPrice: 10, foreignPrice: 70)
        ParkTicketed(id: 3, name: "Maasai Mara National Park", localPrice: 10, foreignPrice: 70)
    ]

    var body: some View {
        ZStack {
            List(parks) { park in
                NavigationLink(destination: TicketSelectionView(park: park, cart: $cart)) {
                    Text(park.name)
                }
            }
            .navigationBarTitle("Parks")
            
            VStack {
                Spacer()
                NavigationLink(destination: CartView(cart: $cart)) {
                    HStack {
                        Image(systemName: "cart.fill")
                        Text("Cart (\(cart.count))")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding(.bottom)
            }
        }
    }
}


struct TicketSelectionView: View {
    let park: ParkTicketed
    @State private var days: Int = 1
    @State private var isLocal: Bool = true
    @Binding var cart: [Ticket]

    var body: some View {
        VStack(spacing: 30) {
            Text(park.name).font(.largeTitle).padding(.top)

            HStack {
                Image(systemName: "person.circle")
                Toggle("Are you a local citizen?", isOn: $isLocal)
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            
            HStack {
                Image(systemName: "calendar")
                Stepper("Days: \(days)", value: $days, in: 1...10)
            }

            Button("Add to Cart") {
                cart.append(Ticket(park: park, days: days, isLocal: isLocal))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Spacer() // Pushes content to the top
        }
        .padding(.horizontal)
    }
}


struct CartView: View {
    @Binding var cart: [Ticket]

    var totalCost: Double {
        return cart.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        VStack(spacing: 20) {
            List(cart) { ticket in
                HStack {
                    VStack(alignment: .leading) {
                        Text(ticket.park.name).font(.headline)
                        Text("\(ticket.days) days")
                        Text(ticket.isLocal ? "Local" : "Foreign")
                    }
                    Spacer()
                    Text("$\(String(format: "%.2f", ticket.price))")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            
            VStack {
                Text("Total: $\(String(format: "%.2f", totalCost))").font(.headline)
                Button("Checkout with Apple Pay") {
                    // TODO: implement Apple Pay checkout
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.top, 20)
            .padding(.horizontal)
        }
        .navigationBarTitle("Cart")
        .padding()
    }
}

