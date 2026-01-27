//
//  FruitListWithSearchApp.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 27/01/26.
//

import SwiftUI
import Combine

struct Fruit : Equatable, Codable {
    var name : String
}

class FruitListWithSearchViewModel : ObservableObject {
    private var masterList : [Fruit] = [
        Fruit(name: "Apple"),
         Fruit(name: "Banana"),
         Fruit(name: "Orange"),
         Fruit(name: "Mango"),
         Fruit(name: "Grapes"),
         Fruit(name: "Pineapple"),
         Fruit(name: "Strawberry"),
         Fruit(name: "Blueberry"),
         Fruit(name: "Watermelon"),
         Fruit(name: "Papaya"),
         Fruit(name: "Kiwi"),
         Fruit(name: "Peach"),
         Fruit(name: "Cherry"),
         Fruit(name: "Pomegranate"),
         Fruit(name: "Lemon"),
         Fruit(name: "Lime"),
         Fruit(name: "Raspberry"),
         Fruit(name: "Blackberry"),
         Fruit(name: "Guava"),
         Fruit(name: "Apricot")
    ]
    @Published var fruitList : [Fruit] = []
    @Published var searchedText = ""
    
    private var cancellation = Set<AnyCancellable>()
    
    func addFruit(fruit : String) {
        if (!fruit.isEmpty && !masterList.contains{ $0.name.lowercased() == fruit.lowercased()}) {
            let newFruit = Fruit(name: fruit)
            masterList.append(newFruit)
            fruitList.append(newFruit)
        }
    }

    init() {
        $searchedText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.search(fruit: text)
            }
            .store(in: &cancellation)
    }
    
    func search(fruit : String) {
        fruitList = fruit.isEmpty ? masterList : masterList.filter { $0.name.localizedCaseInsensitiveContains(fruit) }
    }
}

struct FruitListWithSearchApp: View {
    
    @StateObject private var fruitViewModel = FruitListWithSearchViewModel()
    @State private var fruitName = ""
    @FocusState private var focused : Bool
    @FocusState private var searchFocused : Bool
    
    var body: some View {
        VStack(alignment : .center) {
            HStack {
                TextField("Fruit Name", text: $fruitName)
                .focused($focused)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(focused ? .blue : .gray)
                )
                Button {
                    fruitViewModel.addFruit(fruit: fruitName)
                } label: {
                    Text("Add")
                }
            }
            ScrollView {
                LazyVStack(alignment : .leading) {
                    ForEach(fruitViewModel.fruitList, id : \.name) { element in
                        Text(element.name)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                    }
                }
            }
            TextField("Search Fruit", text: $fruitViewModel.searchedText)
            .focused($searchFocused)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(focused ? .blue : .gray)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .onChange(of: fruitViewModel.fruitList) { oldValue, newValue in
            fruitName = ""
        }
    }
}


#Preview {
    FruitListWithSearchApp()
}
