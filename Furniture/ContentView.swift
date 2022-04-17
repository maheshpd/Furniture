//
//  ContentView.swift
//  Furniture
//
//  Created by Mahesh Prasad on 17/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            TabView()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabView : View {
    @State var index = 0
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack {
                Home()
                    .opacity(self.index == 0 ? 1 : 0)
                
                Search()
                    .opacity(self.index == 1 ? 1 : 0)
                
                Cart()
                    .opacity(self.index == 2 ? 1 : 0)
                
                Account()
                    .opacity(self.index == 3 ? 1 : 0)
            
            }
            
            HStack {
                
                Button {
                    self.index = 0
                } label: {
                    HStack(spacing: 6) {
                        
                        Image("home")
                            .foregroundColor(self.index == 0 ? .white : .primary)
                        
                        if self.index == 0 {
                            
                            Text("Home")
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 0 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    self.index = 1
                } label: {
                    HStack(spacing: 6) {
                        
                        Image("search")
                            .foregroundColor(self.index == 1 ? .white : .primary)
                        
                        if self.index == 1 {
                            Text("Search")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 1 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    self.index = 2
                } label: {
                    HStack(spacing: 6) {
                        Image("cart")
                            .foregroundColor(self.index == 2 ? .white : .primary)
                        
                        if self.index == 2 {
                            Text("Cart")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 2 ? Color("Color") :  Color.clear)
                    .clipShape(Capsule())
                }

                Spacer(minLength: 0)
                
                Button {
                    self.index = 3
                } label: {
                    HStack(spacing: 6) {
                        Image("account")
                            .foregroundColor(self.index == 3 ? .white : .primary)
                        
                        if self.index == 3 {
                            Text("Account")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 3 ?
                                Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }


            }
            .padding(.horizontal, 25)
            .padding(.top)
            //based on device bottom padding will be changed...
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 10 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            //fo shadow...
            .background(self.scheme == .dark ? Color.black : Color.white)
            .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 5, y: -5)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

