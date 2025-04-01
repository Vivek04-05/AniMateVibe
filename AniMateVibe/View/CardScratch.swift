//
//  CardScratch.swift
//  AniMateVibe
//
//  Created by Vivek Patel on 02/04/25.
//


import SwiftUI

struct CardScratch: View {
    
    @State var points : [CGPoint] = []
    
    var body: some View {
            ZStack {
                
                Color("c1").opacity(0.8)
                
                ScratchImageView()
                CashBackInfoView()
                    .mask {
                        Path { path in
                            path.addLines(points)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .round))
                    }
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged { drag in
                               
                                
                                withAnimation {
                                    points.append(drag.location)
                                }
                            }
                            
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

#Preview {
    CardScratch()
}

struct ScratchImageView: View {
    var body: some View {
        Image("bg6")
            .resizable()
            .scaledToFill()
            .cornerRadius(12)
            .shadow(radius: 20)
            .frame(width: 200, height: 200)
           
    }
}

struct CashBackInfoView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image(systemName: "wifi.router.fill")
                    .resizable()
                    .foregroundStyle(Color.black.opacity(0.5).gradient)
                    .scaledToFill()
                    .padding(20)
                Spacer()
                VStack(alignment: .leading, spacing: 6) {
                    Text("₹50 - ₹100")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Text("Discount on Wi-Fi & Broadband Plans")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
                
            }
            .padding(10)
            .background(.white)
            .clipShape(.rect(cornerRadius: 12))
        }
        .frame(width: 200, height: 200)
    }
}
