//
//  PurchaseTicketView.swift
//  kwsapp
//
//  Created by Rayan Popat on 27/06/2023.
//

import SwiftUI

struct PurchaseTicketView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseTicketView()
    }
}

struct ParkTicketed: Identifiable {
    let id: Int
    let name: String
    let localPrice: Double
    let foreignPrice: Double
}

struct Ticket {
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
        ParkTicketed(id: 0, name: "Tsavo", localPrice: 10, foreignPrice: 70),
        ParkTicketed(id: 1, name: "Watamu Marine Park", localPrice: 10, foreignPrice: 20)
    ]

    var body: some View {
        NavigationView {
            List(parks) { park in
                NavigationLink(destination: TicketSelectionView(park: park, cart: $cart)) {
                    Text(park.name)
                }
            }
            .navigationBarTitle("Parks")
            .navigationBarItems(trailing: NavigationLink(destination: CartView(cart: $cart)) {
                Text("Cart")
            })
        }
    }
}

struct TicketSelectionView: View {
    let park: ParkTicketed
    @State private var days: Int = 1
    @State private var isLocal: Bool = true
    @Binding var cart: [Ticket]
    
    var body: some View {
        VStack {
            Text(park.name).font(.title)
            Toggle("Are you a local citizen?", isOn: $isLocal)
            Stepper("Days: \(days)", value: $days, in: 1...10)
            Button("Add to Cart") {
                cart.append(Ticket(park: park, days: days, isLocal: isLocal))
            }
            .padding()
        }
    }
}

struct CartView: View {
    @Binding var cart: [Ticket]
    
    var totalCost: Double {
        return cart.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        VStack {
            ForEach(cart, id: \.park.id) { ticket in
                Text("\(ticket.park.name) - \(ticket.days) days - \(ticket.isLocal ? "Local" : "Foreign") - $\(ticket.price)")
            }
            Text("Total: $\(totalCost)")
            Button("Checkout with Apple Pay") {
                // TODO: implement Apple Pay checkout
            }
        }
        .navigationBarTitle("Cart")
    }
}

