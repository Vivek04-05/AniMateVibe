//
//  StackMenuView.swift
//  AniMateVibe
//
//  Created by Vivek Patel on 01/04/25.
//

import SwiftUI

struct StackMenuView: View {
    @State var isExpended: Bool = false
    let buttons : [String]
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.black.opacity(0.4)]),
                                  startPoint: .top, endPoint: .bottom)
                       .edgesIgnoringSafeArea(.all)
            
            ForEach(buttons.indices, id: \.self) { index in
                Image(systemName: buttons[index])
                    .frame(width: 10,height: 10)
                    .padding()
                    .background(Color(.systemGray4))
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                    .offset(x: 0, y: isExpended ? CGFloat(-60 * (index + 1)) : 0)
                    .opacity(isExpended ? 1 : 0 )
                    .animation(
                        .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)
                            .delay(Double(index) * 0.15),
                        value: isExpended
                    )
            }
            
            Button(action: {
                withAnimation {
                    isExpended.toggle()
                }
            }, label: {
                Image(systemName: isExpended ? "xmark" : "plus")
                    .frame(width: 20,height: 20)
                    .foregroundColor(.gray)
                    .padding(15)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
            })
        }
    }
}

#Preview {
    StackMenuView(buttons: ["circle", "star" , "bell", "bookmark"])
}
