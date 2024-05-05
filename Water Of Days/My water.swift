//
//  My water.swift
//  Water Of Days
//
//  Created by 박하연 on 4/19/24.
//

import SwiftUI

struct My_water: View {
    @State var WaterInformationPopoverPresented = false
    @State var totalDrinked: Double = 0 {
        didSet {
            imageSwitch(TotalDrinked: totalDrinked)
        }
    }
    @State var CheckWater = false
    @State var Remainingalert = false
    @AppStorage("목표물양") var SelectedGoal: Double = 0
    @State var flowerImage: String = "씨앗"
    
    //    @Binding var Nickname: String
    
    func WaterCal(water: Double) -> String {
        return ("\(floor(water*10)/10) L")
    }
    
    func imageSwitch(TotalDrinked: Double) {
        let totalDrinkedAsInt = Int(totalDrinked * 10)
        switch totalDrinkedAsInt {
        case ..<4:
            flowerImage = "씨앗"
        case 4...9:
            flowerImage = "2새싹"
        case 9...14:
            flowerImage = "3꽃"
        case 14...19:
            flowerImage = "4꽃"
        case 19...24:
            flowerImage = "5나무"
        case 24...29:
            flowerImage = "6완성"
        default :
            flowerImage = "6완성"
            
        }
    }
    
    var body: some View {
        ZStack{
            Image("bg_natural_sougen-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.6)
                .ignoresSafeArea()
            HStack{
                VStack{
                    Button(action: {CheckWater = true}, label: {
                        Image("물방울버튼")
                            .padding(10)
                    })
                    .alert(isPresented: $CheckWater) {
                        Alert(title: Text("물 0.5L, 섭취 하셨나요?"),
                              message: Text("내가 물을 마시면 꽃도 물을 마실 수 있어요."),
                              primaryButton: .default(Text("네, 마셨어요!")) {
                            totalDrinked = totalDrinked + 0.5
                        },
                              secondaryButton: .cancel(Text("좀 이따 마실거에요"))
                        )
                    }
                    
                    Button(action: {
                        WaterInformationPopoverPresented = true
                    }, label: {
                        Image("전구모양")
                    })
                    .padding(10)
                    .alert("물을 마십시다! 물을 안마시면 당신의 신체 능력은 저하됩니다.. 뇌 기능도 저하되고요. 두통이 생기고.. 변비가 심해질것입니다. 물을 마셔보세요. 잘 하면 살도 빠집니다. ^-^*", isPresented: $WaterInformationPopoverPresented, actions: {
                    })
                    //                    .popover(isPresented: $WaterInformationPopoverPresented) {
                    //                        WaterInformationView()
                    //                        //근데 왜 text만 green이 되는걸까나..
                    //                            .background(.blue)
                    //                    }
                    
                    Button(action: {Remainingalert = true}, label: {
                        ZStack{
                            Image("빈동그라미")
                            HStack {
                                Text("\(WaterCal(water: totalDrinked))")
                            }
                            .padding(.bottom,6)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.indigo)
                        }
                    })
                    .padding(10)
                    .alert("Keep moisturizing yourself✨", isPresented: $Remainingalert, actions: {
                    })
                }
                .padding(.leading, 280)
            }
            .padding(.bottom, 430)
            
            Image("\(flowerImage)")
                .resizable()
                .frame(width: 200, height: 240)
                .padding(.top, 400)
                .padding(.trailing, 20)
                .animation(.default)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
        }
    }
    
}

#Preview {
    My_water(totalDrinked: Double(0), SelectedGoal: Double())
    }
