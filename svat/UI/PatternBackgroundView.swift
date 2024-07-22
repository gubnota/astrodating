//
//  PatternBackgroundView.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 20.07.2024.
//

import SwiftUI

struct PatternBackgroundView: UIViewRepresentable {
    let imageName: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: imageName)!)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
