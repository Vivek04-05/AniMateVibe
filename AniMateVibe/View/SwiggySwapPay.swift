//
//  SwiggySwapPay.swift
//  AniMateVibe
//
//  Created by Vivek Patel on 31/03/25.
//


import SwiftUI

struct SwiggySwapPay: View {
    
    var body: some View {
        SwiggySwipeButtton()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

struct SwiggySwipeButtton: View {
    
    @State var buttonOffset : CGFloat = 0
    private let buttonWidth: CGFloat = 70
    private let screenWidth: CGFloat = UIScreen.main.bounds.width - 20
    
    var body: some View {
        
        
        ZStack(alignment : .bottom) {
            
            buttonOffset >= screenWidth * 0.6 ? Color("c1") : Color("c2")
            
            ZStack(alignment : .leading){
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.green)
                    .frame(width : screenWidth,height: buttonWidth)
                    .overlay {
                        Text("Slide to pay | $200")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Color.white)
                    }
                
                
                ZStack(alignment: .center) {
                    Circle()
                        .foregroundStyle(Color.white)
                    
                    Image(systemName: buttonOffset >= screenWidth * 0.6 ?  "checkmark.circle" : "arrow.forward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: buttonWidth / 2.3, height: buttonWidth / 2.3)
                        .foregroundStyle(Color.green.opacity(0.8))
                        .rotationEffect(buttonOffset <= screenWidth * 0.6 ?
                                        Angle.degrees(Double(buttonOffset / (screenWidth - buttonWidth)) * 180)
                                        : Angle.degrees(0.0))
                }
                .padding(.horizontal,5)
                .frame(width: buttonWidth, height: buttonWidth)
                .offset(x: buttonOffset , y: 0)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            let newOffset = value.location.x
                            buttonOffset = min(max(0, newOffset), screenWidth - buttonWidth)
                        })
                    
                        .onEnded({ value in
                            if buttonOffset >= screenWidth * 0.6 {
                                withAnimation {
                                    buttonOffset = screenWidth - buttonWidth
                                }
                                
                                print("Perform some Action")
                            } else {
                                withAnimation {
                                    buttonOffset = 0
                                }
                            }
                            
                        })
                )
            }.padding(.bottom, 30)
        }.ignoresSafeArea()
        
    }
}

#Preview {
    SwiggySwapPay()
}
