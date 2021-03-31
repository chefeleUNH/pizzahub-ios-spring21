//
//  MenuItemDetailView.swift
//  pizzahub-ios-spring21
//
//  Created by Charles Hefele on 3/30/21.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct MenuItemDetailView: View {
    @State private var imageURL = URL(string: "")
    @ObservedObject var menuItem: MenuItem
    @ObservedObject var pizzeria: Pizzeria
    
    var body: some View {
        VStack {
            WebImage(url: imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(menuItem.name)
                .font(.largeTitle)
                .padding()
            Button("Add to cart") {
                self.addToCart()
            }.font(.headline)
            Spacer()
        }
        .onAppear(perform: loadImageFromFirebase)
        .navigationBarTitle(Text(menuItem.name), displayMode: .inline)
    }
    
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: menuItem.photo)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            self.imageURL = url!
        }
    }
    
    func addToCart() {
        print("Adding to cart")
        //TODO: add it to the cart
    }
    
}
