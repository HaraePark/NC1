//
//  Setting.swift
//  Water Of Days
//
//  Created by 박하연 on 4/19/24.
//

import SwiftUI

struct Setting: View {
    
    @AppStorage("닉네임") var Nickname = ""
    @AppStorage("상태메시지") var Message = ""
    @AppStorage("목표물양") var SelectedGoal = 0.5
    @State var Languagealert = false
    @State var Contactalert = false

    func WaterCal(water: Double) -> String {
        return ("\(floor(water*10)/10) L")
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .padding(.leading, 30)
                            VStack{
                                HStack{
                                    Text("@")
                                        .fontWeight(.bold)
                                        .font(.system(size: 25))
                                        .padding(1)
                                        .padding(.leading, 10)
//                                    TextField(text: $NewText, label: {
//                                        Text("Write your nickname.")
//                                    })
                                    Text("\(Nickname)")
                                    Spacer()
                                }
                            
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 200, height: 60)
                                    .foregroundColor(.gray)
                                    .opacity(0.2)
//                                    .overlay(TextField(text: $NewLine, label: {
//                                        Text("   상태메시지를 입력하세요.")
//                                    }))
                                    .overlay{
                                        Text("\(Message)")
                                    }
                                    .padding(.top, 2)
                                    .padding(.bottom, 6)
                                HStack{
                                    Text("Goal :")
                                        .font(.caption)
                                        .padding(.leading, 10)
                                    Text("\(WaterCal(water:SelectedGoal))")
                                        .font(.caption)
                                    Spacer()
                                }
                                }
                            .padding()
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                        Divider()
                            .padding(20)
                        //Navigation
                        NavigationLink(destination: Account(Nickname: $Nickname, Message: $Message, SelectedGoal: $SelectedGoal), label: {
                            HStack {
                                Image("account")
                                    .padding(.leading, 30)
                                    .padding(.trailing, 10)
                                Text("Account")
                                    .foregroundColor(.black)
                                Spacer()
                            }})
                        Divider()
                            .padding(20)
                        
                        // 언어 정보
                        HStack {
                            Button(action: {
                                Languagealert = true
                            }, label: {
                                Image("language")
                                    .padding(.leading, 30)
                                    .padding(.trailing, 10)
                                Text("Language")
                                    .foregroundColor(.black)
                                Spacer()
                            })
                            .alert("English", isPresented: $Languagealert, actions: {
                            })
                        }
                        Divider()
                            .padding(20)
                        
                        HStack {
                            Button(action: {
                                Contactalert = true
                            }, label: {
                                Image("contact")
                                    .padding(.leading, 30)
                                    .padding(.trailing, 10)
                                Text("Contact")
                                    .foregroundColor(.black)
                                Spacer()
                            })
                            .alert("olvgrn879@postech.ac.kr \n 연락해ㅎㅎ", isPresented: $Contactalert, actions: {
                            })
                        }
                        Divider()
                            .padding(20)
                        
                        HStack {
                            Button(action: {}, label: {
                                Text("ver. 1.01 🩶")
                                    .foregroundColor(.gray)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 35)
                                    .padding(.trailing, 10)
                            })
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}


//
//    #Preview {
//        Setting()
//    }


struct Setting_Preview: PreviewProvider {
    static var previews: some View{
        Setting()
    }
}
