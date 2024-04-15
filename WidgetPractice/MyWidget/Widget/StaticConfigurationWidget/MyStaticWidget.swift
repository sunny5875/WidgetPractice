//
//  MyStaticWidget.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import SwiftUI
import WidgetKit

struct MyStaticWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.sunny.widget2", // 위젯을 식별하는 문자열
            provider: StaticProvider() // TimelineProvider를 준수
        ) { entry in
            StaticWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("써니의 위젯2")
        .description("두번째 예시 위젯입니다.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


