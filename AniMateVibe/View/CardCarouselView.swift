//
//  CardCarouselView.swift
//  AniMateVibe
//
//  Created by Vivek Patel on 02/04/25.
//

import SwiftUI

struct CardCarouselView : View {
    var body : some View {
      
            CarouselView()
            .preferredColorScheme(.dark)
       
    }
}


struct CarouselView : View {
    
    let cards = [
        CardModel(title: "Explore", color: .indigo),
        CardModel(title: "Learn", color: .mint),
        CardModel(title: "Apply", color: .purple),
        CardModel(title: "Share", color: .pink),
        CardModel(title: "Success", color: .orange)
    ]
    
    @State var activeCardID : UUID?
    @State var scrollOffset : CGFloat = 0
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .frame(width: 300)
                            .visualEffect { content, geometry in
                                content
                                    .scaleEffect(scaleValue(for: geometry))
                                    
                            }
                            .onTapGesture {
                                withAnimation(.spring) {
                                    activeCardID = card.id
                                }
                            }
                        

                    }
                }
                .scrollTargetLayout()
                .padding(.horizontal, 60)
            }
            .scrollPosition(id: $activeCardID)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .frame(height: 400)
            .padding(.vertical)
            
            pageIndecator(totalIndex: cards.count, selectedIndex: activeCardIndex)
                
            Spacer()
        }
        .onAppear {
            activeCardID = cards.first?.id ?? UUID()
        }
       
      
        
    }
    
    
    private func scaleValue(for geometry : GeometryProxy) -> CGFloat {
        let rect = geometry.frame(in: .scrollView)
        let containrWidth = UIScreen.main.bounds.width
        
        let distnace = abs(rect.midX - (containrWidth / 2))
        let scale = max(1 - distnace / (containrWidth * 0.8), 0.7)
        
        return scale
    }
    
    private var activeCardIndex : Int {
        cards.firstIndex{ $0.id == activeCardID} ?? 0
    }
}


struct CardView :View {
    let card : CardModel
    var body : some View {
        
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(card.color)
            
            Text(card.title)
                .font(.system(size: 20, weight: .bold, design: .serif))
                .foregroundStyle(.white)
                .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
                
        }
    }
}


#Preview {
    CardCarouselView()
}


