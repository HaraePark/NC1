//
//  ContentView.swift
//  Water Of Days
//
//  Created by 박하연 on 4/19/24.
//

import SwiftUI

struct ContentView: View {

    @State private var color: Color = .blue
    @State private var date = Date.now
    @State var memo: String = ""
    @Binding var TotalDrinked: Double
    @Binding var SelectedGoal: String
    
    func WaterCal() -> String {
        return ("\(floor(TotalDrinked/100)/10) L")
    }

    
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let fullMonthNames = Date.fullMonthNames
    
    @State private var days: [Date] = []
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .ignoresSafeArea()
        
            VStack {
                //            LabeledContent("색상을 골라보거라!") {
                //                ColorPicker("", selection: $color, supportsOpacity: true)
                //            }
                //            LabeledContent("Date/Time") {
                //                DatePicker("", selection: $date)
                //            }
                HStack {
                    Text("April")
                        .padding()
                        .font(.largeTitle)
                        .fontWeight(.light)
                    //                ForEach(fullMonthNames, id: \.self) { monthName in
                    //                    Text(monthName)
                    ColorPicker("", selection: $color, supportsOpacity: true)
                        .padding()
                }
                HStack {
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .foregroundStyle(color)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                }
                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        if day.monthInt != date.monthInt
                        {Text("")} else {
                            Text(day.formatted(.dateTime.day()))
                                .fontWidth(.standard)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(
                                    Circle()
                                        .foregroundColor(
                                            date.startOfDay == day.startOfDay
                                            ? .red.opacity((0.2))
                                            :  color.opacity(0.2)))
                                .onTapGesture {
                                    date = day
                                }
                            
                        }
                    }
                }
                .padding()
                .onAppear{
                    days = date.calendarDisplayDays
                }
                .onChange(of: date) {
                    days = date.calendarDisplayDays
                }
            }
        }
    }
    }
private struct daywaterView: View {
    var body: some View {
        @State var daywaterViewpopover = true
        HStack {
            Image("")
            VStack{
                //                Text("Drank \(TotalDrinked()) Water")
                //                    .font(.title)
                //                Text("Goal : \(Watercal())")
                //                Text("Memo.")
                //                RoundedRectangle(cornerRadius: 10)
                //                    .overlay{
                //                        TextField(text: $memo, label: {Text( " Write down your memo! ✎")})
                //                    }
            }
        }
    }
}
    #Preview {
        ContentView(TotalDrinked: .constant(0), SelectedGoal: .constant(""))
    }
