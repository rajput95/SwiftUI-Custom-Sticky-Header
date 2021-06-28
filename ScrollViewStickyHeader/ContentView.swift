//
//  ContentView.swift
//  ScrollViewStickyHeader
//
//  Created by Moin Rajput on 15/05/2021.
//

import SwiftUI

let AccessoryIconTrailingPadding: CGFloat = 10

let dataDict: [ProductsListCellViewModel] = [ProductsListCellViewModel(name: "Cricket Bat", price: "$50.90", image: "cricket-bat"),
                                             
                                             ProductsListCellViewModel(name: "Baseball Bat", price: "$55.57", image: "baseball-bat"),
                                             
                                             ProductsListCellViewModel(name: "Football", price: "$98.67", image: "football"),
                                             
                                             ProductsListCellViewModel(name: "Chess Board", price: "$78.75", image: "chess-board"),
                                             
                                             ProductsListCellViewModel(name: "Boxing Gloves", price: "$44.42", image: "boxing-gloves"),
                                             
                                             ProductsListCellViewModel(name: "MMA Gloves", price: "$44.99", image: "mma-gloves"),
                                             
                                             ProductsListCellViewModel(name: "Cricket Bat", price: "$50.90", image: "cricket-bat"),
                                             
                                             ProductsListCellViewModel(name: "Baseball Bat", price: "$55.57", image: "baseball-bat"),
                                             
                                             ProductsListCellViewModel(name: "Football", price: "$98.67", image: "football"),
                                             
                                             ProductsListCellViewModel(name: "Chess Board", price: "$78.75", image: "chess-board"),
                                             
                                             ProductsListCellViewModel(name: "Boxing Gloves", price: "$44.42", image: "boxing-gloves"),
                                             
                                             ProductsListCellViewModel(name: "MMA Gloves", price: "$44.99", image: "mma-gloves")
]

struct ContentView: View {
    // MARK: Properties
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect() /// Publisher used to track offset for settings title to show/hide sticky header.
    @State private var isHeaderViewVisible = false
    @State private var isScrollViewBouncing = false
    
    // MARK: View Life Cycle
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    ScrollView {
                        GeometryReader { geometry in
                            HStack(alignment: .top) {
                                Text("My Sports Shop")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 16)
                                    .padding(.top, 40)
                                    .opacity(isHeaderViewVisible ? 0.0 : 1.0)
                            } //: HStack
                            .frame(height: geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + 80 : 80)
                            .background(Color(UIColor.purple))
                            .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                        } //: GeometryReader
                        .padding(.bottom, 70)
                        
                        GeometryReader { geometry in
                            SearchBar()
                                .onReceive(self.timer) { _ in
                                    if !isScrollViewBouncing {
                                        let globalFrame = geometry.frame(in: .global)
                                        
                                        print("Gloabl frame: \(globalFrame)")
                                        /// Show Sticky Header View
                                        if globalFrame.origin.y <= 20 {
                                            withAnimation {
                                                isHeaderViewVisible = true
                                            }
                                        } else { /// Hide Sticky Header View
                                            withAnimation {
                                                isHeaderViewVisible = false
                                            }
                                        }
                                    }
                                }
                        } //: GeometryReader
                        .frame(height: 50)
                     
                        ProductsListCells()
                    } //: ScrollView
                } //: VStack
                
                if isHeaderViewVisible {
                    VStack(alignment: .center) {
                        Text("My Sports Shop")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .font(.subheadline)
                    } //: VStack
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color(UIColor.purple))
                }
            } //: ZStack
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ProductsListCells: View {
    // MARK: - Properties
    let listData = dataDict
    
    // MARK: - View Life Cycle
    var body: some View {
        ForEach(listData, id: \.name) { listItem in
                ZStack(alignment: .bottom) {
                    Image(listItem.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 5)
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "suit.heart")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.leading, 10)
                       
                        
                        Spacer()
                        
                        Text(listItem.name)
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "cart")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.trailing, 10)
                    } //: HStack
                    .frame(height: 40)
                    .background(Color(UIColor.black).opacity(0.8))
                    .cornerRadius(10)
                   
                } //: ZStack
                .frame(height: 100)
                .background(Color.purple.opacity(0.4))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 16.0)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
