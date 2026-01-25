//
//  CounterApp.swift
//  SwiftUIForge
//
//  Created by Mohit Varma on 25/01/26.
//

import SwiftUI

class CounterViewModel : ObservableObject {
    @Published private var counter = 0
    @Published var showDialog = false
    @Published var message = ""
    
    func increment() {
        counter += 1
        if (showDialog) {
            showDialog = false
            message = ""
        }
    }
    
    func decrement() {
        if (counter != 0) {
            counter -= 1
        }else {
            showDialog = true
            message = "counter will not be decrement more. try to increase the counter"
        }
    }
    
    func getCounter() -> Int {
        return counter
    }
 }

struct CounterView: View {
    
    @StateObject var vm : CounterViewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.getCounter())")
            HStack {
                Button {
                    vm.increment()
                } label: {
                    Text("Increment")
                }
                Button {
                    vm.decrement()
                } label: {
                    Text("Decrement")
                }
            }
            if(vm.showDialog) {
                Text(vm.message)
            }
        }
    }
}
