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
            .scaledToFill()
            .frame(width: width, height: height)
    }
  
    func setupText(text: String, font: Font, color: Color = .black, weight: Font.Weight) -> some View {
        Text(text)
            .font(font)
            .fontWeight(weight)
            .foregroundStyle(color)
    }
    
    func setupAsyncImage(
        urlString: String,
        width: CGFloat,
        height: CGFloat,
        contentMode: ContentMode = .fill
    ) -> some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: width, height: height)
            case .failure:
                Image(uiImage: UIImage.exclamationMarkDark)
                    .resizable()
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: width, height: height)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func showErrorAlert(isPresented: Binding<Bool>, errorMessage: String, okAction: (() -> Void)? = nil) -> some View {
        alert("Error", isPresented: isPresented) {Button("OK", role: .cancel)
            {
                okAction?()
            }
        } message: {
            Text(errorMessage)
        }
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
