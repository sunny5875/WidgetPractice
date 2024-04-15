//
//  StaticEntryView.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import SwiftUI
import WidgetKit

struct StaticWidgetEntryView : View {
    var entry: StaticProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}
