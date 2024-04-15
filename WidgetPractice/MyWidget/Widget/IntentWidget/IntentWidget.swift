//
//  IntentWidget.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import SwiftUI

struct IntentWidget: Widget {
    let kind: String = "IntentWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: WidgetThemeIntent.self,
            provider: IntentProvider()
        ) { entry in
            IntentWidgetEntryView(entry: entry)
                .containerBackground(.clear, for: .widget)
        }
        .configurationDisplayName("써니의 컬러위젯")
        .description("이모지와 색상을 골라보세요!")
        .supportedFamilies([.systemMedium, .systemSmall, .systemLarge])
    }
}
