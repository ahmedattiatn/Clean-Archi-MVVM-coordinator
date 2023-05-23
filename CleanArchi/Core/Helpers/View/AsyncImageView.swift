//
//  AsyncImageView.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import SwiftUI

// MARK: - AsyncImageView

struct AsyncImageView: View {
    let stringURL: String
    var title: String?
    var scale: CGFloat

    init(stringURL: String, title: String? = nil, scale: CGFloat = 4) {
        self.stringURL = stringURL
        self.title = title
        self.scale = scale
    }

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: stringURL), scale: scale) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Text("No_image_available".localized)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding(Dimension.padding16)
            if let title {
                Text(title)
                    .font(.headline)
            }
        }
    }
}
