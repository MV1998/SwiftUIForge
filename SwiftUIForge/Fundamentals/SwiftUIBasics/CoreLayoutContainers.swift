//
//  CoreLayoutContainers.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 25/01/26.
//

import SwiftUI

struct CoreLayoutContainers: View {
    @State var vStackAlignment : HorizontalAlignment = .leading
    @State var hStackAlignment : VerticalAlignment = .top
    @State var spacing : Float = Float(10)
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment : vStackAlignment) {
                    Text("Leading Alighment")
                        .border(Color.red)
                    Text("All Views are aligned to the left. added some extra text to fill the full width")
                    HStack {
                        Button {
                            vStackAlignment = .leading
                        } label: {
                            Text("leading")
                        }
                        
                        Button {
                            vStackAlignment = .center
                        } label: {
                            Text("center")
                        }
                        
                        Button {
                            vStackAlignment = .trailing
                        } label: {
                            Text("trailing")
                        }

                    }
                    .overlay {
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 1)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .top)
                .overlay {
                    Rectangle()
                        .stroke(Color.blue, lineWidth: 1)
                }
            
                
                HStack(alignment : hStackAlignment) {
                    Text("This is text in HStack")
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun commodo consequat. Duis aute irure dolor in repr Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis")
                }
                .frame(maxWidth: .infinity)
                .overlay {
                    Rectangle()
                        .stroke(Color.blue, lineWidth: 1)
                }
                
                VStack {
                    Button {
                        hStackAlignment = .top
                    } label: {
                        Text("top")
                    }
                    
                    Button {
                        hStackAlignment = .center
                    } label: {
                        Text("center")
                    }
                    
                    Button {
                        hStackAlignment = .bottom
                    } label: {
                        Text("bottom")
                    }
                }
                
                HStack {
                    Text("left")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("middle")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("right")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .padding()
    }
}


#Preview {
    CoreLayoutContainers()
}
