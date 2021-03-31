//
//  PizzeriaRow.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/18/21.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct PizzeriaRow: View {
    @State private var imageURL = URL(string: "")
    @ObservedObject var pizzeria: Pizzeria
    
    var body: some View {
        HStack {
            WebImage(url: imageURL)
                .resizable()
                .frame(width: 125, height: 100)
                .cornerRadius(25)
            Text(pizzeria.name)
        }.onAppear(perform: loadImageFromFirebase)
    }
    
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: pizzeria.logo)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            self.imageURL = url!
        }
    }
}
