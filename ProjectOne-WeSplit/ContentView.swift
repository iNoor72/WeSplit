//
//  ContentView.swift
//  ProjectOne-WeSplit
//
//  Created by Noor Walid on 11/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount: String = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    var totalAmountPerPerson : Double {
        let totalAmount = Double(billAmount) ?? 0
        let peopleNumber = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentages[tipPercentage])
        
        let amountWithTip = (totalAmount * tipSelected/100) + totalAmount
        return amountWithTip / peopleNumber
    }
    
    let tipPercentages = [10,15,20,25]
    
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Enter the total amount", text: $billAmount)
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                
                Section(header: Text("How much tip you want to add?")) {
                    Picker("Tip Amount:", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$ \(totalAmountPerPerson, specifier: "%.2f")")
                }
            }
//            .navigationTitle("WeSplit")
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
