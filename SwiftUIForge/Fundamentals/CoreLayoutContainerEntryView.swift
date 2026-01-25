//
//  CoreLayoutContainerEntryView.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 25/01/26.
//

import SwiftUI

struct CoreLayoutContainerEntryView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Core Layout Containers") {
                    CoreLayoutContainers()
                }
            }
        }
        .navigationTitle("SwiftUI Basic")
    }
}

#Preview {
    CoreLayoutContainerEntryView()
}
