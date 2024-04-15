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
        .configurationDisplayName("써니의 위젯")
        .description("매분마다 새로운 이모지와 퇴근시간을 알 수 있습니다.")
        .supportedFamilies([.systemMedium, .systemSmall, .systemLarge])
    }
}
