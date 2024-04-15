//
//  MyWidget.swift
//  MyWidget
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import SwiftUI

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ConfigurationAppIntent.self,
            provider: Provider()
        ) { entry in
            MyWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("써니의 위젯")
        .description("매분마다 새로운 이모지와 퇴근시간을 알 수 있습니다.")
        .supportedFamilies([.systemMedium, .systemSmall, .systemLarge])
    }
}
