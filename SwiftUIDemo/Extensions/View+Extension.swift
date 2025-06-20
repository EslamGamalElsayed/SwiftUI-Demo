//
//  View+Extension.swift
//  Shipper
//
//  Created by Eslam Gamal on 29/05/2025.
//

import SwiftUI

extension View {
    func setupImage(imageName: String, width: CGFloat, height: CGFloat) -> some View {
        Image(imageName)
            .resizable()
            .frame(width: width, height: height)
    }
    
    func setupText(text: String, font: Font, color: Color = .black) -> some View {
        Text(text)
            .font(font)
            .foregroundColor(color)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
