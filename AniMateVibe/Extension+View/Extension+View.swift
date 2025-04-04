//
//  Extension+View.swift
//  AniMateVibe
//
//  Created by Vivek Patel on 02/04/25.
//


import SwiftUI

extension View {
    
    // For page indicator
    @ViewBuilder
    func pageIndecator(totalIndex : Int , selectedIndex : Int) -> some  View {
        HStack(spacing: 8) {
            ForEach(0..<totalIndex, id: \.self) { index in
                Capsule()
                    .fill(index == selectedIndex ? .white : .gray.opacity(0.5))
//                    .scaleEffect(index == selectedIndex ? 1.3 : 1.0, anchor: .center)
                    .frame(width: index == selectedIndex ? 24 : 8, height: 10)
                    .animation(.spring, value: selectedIndex)
            }
        }
    }
    
    
}
