//
//  StateAndDataFlowEntryView.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 25/01/26.
//

import SwiftUI

struct StateAndDataFlowEntryView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
                NavigationLink("Counter App") {
                    CounterView()
                }
            }
        }
        .navigationTitle("State & Data Flow")
    }
}

#Preview {
    StateAndDataFlowEntryView()
}
