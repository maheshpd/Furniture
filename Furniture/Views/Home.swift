//
//  Home.swift
//  Furniture
//
//  Created by Mahesh Prasad on 17/04/22.
//

import SwiftUI

struct Home: View {
    
    @Environment(\.colorScheme) var scheme
    @State var search = ""
    
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                HStack(spacing: 15) {
                    
                    Button {
                        
                        print("Menu")
                        
                    } label: {
                        Image("menu")
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                        print("qr")
                        
                    } label: {
                        Image("qr")
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                        
                        //changing user interface style...
                        
                        UIApplication.shared.windows
                            .first?
                            .rootViewController?
                            .overrideUserInterfaceStyle = self.scheme == .dark ? .light : .dark
                    } label: {
                        
                    
                        Image(systemName: self.scheme == .dark  ? "sun.max.fill" : "moon.fill")
                            .font(.system(size: 22))
                            // for dark mode adoption....
                            .foregroundColor(.primary)
                    }
                }
                
                Text("Furnitures")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        TextField("Search", text: self.$search)
                        
                        if self.search != "" {
                            
                            Button {
                                print("search")
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.primary)
                            }
                            
                        }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.primary.opacity(0.06))
                    .cornerRadius(12)
                    
                    HStack{
                        Text("Today's Pick")
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Spacer()
                    }
                    .padding(.top, 22)
                    
                    VStack {
                        
                        Image("main")
                        
                        Text("ArmChair")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(.top, -30)
                        
                        Text("$1200")
                            .foregroundColor(.gray)
                            .padding(.top,8)
                            .padding(.bottom)
                    }
                    .background(
                        
                        Color.primary.opacity(0.06)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .cornerRadius(25)
                            .padding(.top, 95)
                        
                    )
                    .padding(.top, 25)
                    
                    HStack{
                        Text("Recommended For You")
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    
                    
                    ForEach(furnitures, id: \.self) { furniture in
                        
                        HStack(spacing: 15) {
                            
                            ForEach(furniture){ i in
                                
                                VStack {
                                    
                                    Image(i.image)
                                    
                                    Text(i.title)
                                        .fontWeight(.bold)
                                    
                                    Text(i.price)
                                        .padding(.top, 6)
                                    
                                }
                                .padding()
                                .background(Color.primary
                                    .opacity(0.06))
                                .cornerRadius(10)
                            }
                        }
                        
                    }
                    
                }
                .padding()
            }
            
            Spacer()
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//sample Data...

struct Furniture : Identifiable, Hashable {
    
    var id: Int
    var image : String
    var title : String
    var price : String
}

//2D array For Grid Function....

var furnitures = [
    [
        Furniture(id: 0, image: "r11", title: "Wood Frame", price: "$1200"),
        
        Furniture(id: 1, image: "r12", title: "Yellow Armchair", price: "$600")
    ],
    
    [
        Furniture(id: 2, image: "r21", title: "Modern Armchair", price: "$240"),
        Furniture(id: 3, image: "r22", title: "IKEA Ingolf", price: "$1500")
    ],
    
    [
        Furniture(id: 4, image: "r31", title: "Yello Wheel", price: "$2200"),
        Furniture(id: 5, image: "r32", title: "Scandinavin", price: "$1650")
    ]
]
