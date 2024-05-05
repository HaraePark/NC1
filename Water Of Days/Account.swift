//
//  Account.swift
//  Water Of Days
//
//  Created by 박하연 on 4/19/24.
//

import SwiftUI

struct Account: View {
    @Binding var Nickname: String
    @Binding var Message: String
    @Binding var SelectedGoal: Double
    @State var Savealert = false
    let Goals: [Double] = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]
    
    func WaterCal(water: Double) -> String {
        return ("\(floor(water*10)/10) L")
    }
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack { //닉네임
                    Text ("Nickname : ")
                        .padding(.leading, 16)
                    Text ("@")
                        .fontWeight(.black)
                    TextField(text: $Nickname, label: {Text( " Write down ! ✎")})
                }
                .padding(.top, 50)
                
                Divider()
                    .padding()
                HStack { //상태메시지
                    Text ("Message  : ")
                        .padding(.leading, 15.5)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 265, height: 40)
                        .foregroundColor(.gray)
                        .opacity(0.2)
                        .overlay{
                            TextField(text: $Message, label: {
                                Text(". Write down ! ✎ ")
                            })
                        }
                    Spacer()
                }
                
                Divider()
                    .padding()
                HStack {
                    Text ("Goal          : ")
                        .padding(.leading, 15.5)
                    Picker("Choose your goal", selection: $SelectedGoal) {
                        ForEach(Goals, id: \.self) { goal in
                            Text("\(WaterCal(water: goal))")
                        }
                    }
                    Spacer()
                }
                
                Button(action: {Savealert = true}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 70, height: 40, alignment: .center)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Text("Save")
                            .foregroundColor(.black)
                    }
                    .padding(.top, 50)
                })
                .alert("저장되었습니다.", isPresented: $Savealert, actions: {
                })
            }
            }
    }
}

#Preview {
    Account(Nickname: .constant(""), Message: .constant(""), SelectedGoal: .constant(1.0))
}
