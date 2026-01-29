//
//  EventHandlingModifiersList.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 29/01/26.
//

import SwiftUI

class EventHandlingModifiersListViewModel : ObservableObject {
    @Published var count = 0
    
    init() {
        Task {
            while(true)  {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                await MainActor.run {
                    count += 1
                }
            }
        }
    }
    
}

struct EventHandlingModifiersList: View {
    @State private var isVisible : Bool = true
    @State private var onAppearCount : Int = 0
    @State private var onDisappearCount : Int = 0

    @State private var onTapGesture : Int = 0
    @State private var onLongTapGesture : Int  = 0
    

    @State private var textFieldValue : String = ""
    
    
    @State private var plainTextFieldValue = ""
    
    @StateObject private var eventHandlingModifiersListViewModel = EventHandlingModifiersListViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(alignment : .leading) {
                Section(content : {
                    VStack {
                        Button {
                            isVisible = !isVisible
                        } label: {
                            Text(isVisible ? "Hide" : "Show")
                        }
                        .buttonStyle(.borderedProminent)
                        if (isVisible) {
                            Text("I can be disappeared and appeared by toggling above button")
                                .padding()
                                .frame(alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .onAppear() {
                                    onAppearCount = onAppearCount + 1
                                }
                                .onDisappear {
                                    onDisappearCount = onDisappearCount + 1
                                }
                        }
                        HStack{
                            Text("OnAppear : \(onAppearCount)")
                            Text("On Disappear : \(onDisappearCount)")
                        }
                    }
                }, header: {
                    Text("onAppear and onDisappear Usage")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.regularMaterial)
                )
                
                
                Section(content : {
                    Text("Text with OnTapGesture \(onTapGesture)")
                        .onTapGesture {
                            onTapGesture += 1
                        }
                    Text("Text with onLongTapGesture \(onLongTapGesture)")
                        .onLongPressGesture {
                            onLongTapGesture += 1
                        }
                }, header: {
                    Text("onTapGesture and onLongTapGesture Usage")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.regularMaterial)
                )
                
                
                Section(content : {
                    TextField("Enter Name", text: $textFieldValue)
                    
                    
                    Text("I am a Text with onChange Modifier \(plainTextFieldValue)")
                        .onChange(of: textFieldValue) { oldValue, newValue in
                            plainTextFieldValue = newValue
                            
                        }
                }, header: {
                    Text("onChange Usage")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.regularMaterial)
                )
                
                
                Section(content : {
                    TextField("Enter Name", text: $textFieldValue)
                        .onSubmit {
                            print("Keyboard Send/Enter button tapped.")
                        }
                }, header: {
                    Text("onSubmit Usage")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.regularMaterial)
                )
                
                
                Section(content : {
                    Text("\(eventHandlingModifiersListViewModel.count)")
                        .onReceive(eventHandlingModifiersListViewModel.$count) { value in
                            print(value)
                        }
                }, header: {
                    Text("OnReceive Usage")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.regularMaterial)
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    EventHandlingModifiersList()
}
