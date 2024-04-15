//
//  IntentWidgetEntryView.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import SwiftUI


struct IntentWidgetEntryView : View {
    var entry: IntentEntry

    var body: some View {
        VStack(spacing: 12 ) {
            Spacer()
            Text(String(repeating: entry.configuration.emoji.toEmoji, count: 5))
                .frame(maxWidth: .infinity)
            Text(entry.configuration.emoji.description)
            Text(String(repeating: entry.configuration.emoji.toEmoji, count: 5))
                .frame(maxWidth: .infinity)
            Spacer()
        }
        .background(entry.configuration.color.toColor)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

extension EmojiType {
    var toEmoji: String {
        switch self {
        case .unknown:
            "😛"
        case .smile:
            "😃"
        case .heart:
            "🥰"
        case .celebrate:
            "🥳"
        }
    }
    var description: String {
        switch self {
        case .unknown:
            "default"
        case .smile:
            "smile"
        case .heart:
            "heart"
        case .celebrate:
            "celebrate"
        }
    }
}

extension ColorType {
    var toColor: Color {
        switch self {
        case .unknown:
            return .orange
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
}
