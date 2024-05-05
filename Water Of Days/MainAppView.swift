//
//  MainAppView.swift
//  Water Of Days
//
//  Created by 박하연 on 4/19/24.
//

import SwiftUI

struct MainAppView: View {
//    @Binding var Nickname: String
    
    var body: some View{
        TabView {
            ContentView(TotalDrinked: .constant(0), SelectedGoal: .constant(""))
                .tabItem {
                    Image(systemName: "calendar.circle")
                    Text("Calendar")
                }
            
            My_water(totalDrinked: Double(), SelectedGoal: Double())
                .tabItem {
                    Image(systemName: "drop.circle")
                    Text("My water")
                }
            
            Setting()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("setting")
                }
            
            
            
        }
    }
}

#Preview {
    MainAppView()
}

