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
    @EnvironmentObject var cart: ShoppingCart
    @State private var showingCartAlert = false
    
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
        .alert(isPresented: $showingCartAlert) {
            Alert(title: Text("Invalid Request"), message: Text("The item you are trying to add to the shopping cart is from a different pizzeria. Only one pizzeria is allowed in the shopping cart at a time."), dismissButton: .default(Text("OK")))
        }
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
        do {
            try self.cart.add(item: self.menuItem, pizzeria: self.pizzeria)
        } catch ShoppingCartError.menuItemDoesNotMatchPizzeria {
            print("menu item doesn't match pizzeria")
            showingCartAlert.toggle()
        } catch {
            print("failed for another reason")
        }
    }
    
}
