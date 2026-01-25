//
//  AppEntryView.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 25/01/26.
//

import SwiftUI

struct AppEntryView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Intermediate") {
                    NavigationLink("State & Data Flow") {
                        StateAndDataFlowEntryView()
                    }
                }
            }
        }
        .navigationTitle("SwiftUIForge")
    }
}

#Preview {
    AppEntryView()
}
