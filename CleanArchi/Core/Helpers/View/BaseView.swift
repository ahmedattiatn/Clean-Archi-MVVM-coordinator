//
//  BaseView.swift
//
//
//  Created by Ahmed ATIA on 04/05/2023.
//

import SwiftUI

// MARK: - BaseView

struct BaseView<Content>: View where Content: View {
    @Environment(\.presentationMode) var presentation

    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
