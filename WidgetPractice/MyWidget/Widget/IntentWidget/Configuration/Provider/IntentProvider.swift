//
//  IntentProvider.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import SwiftUI


struct IntentProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> IntentEntry {
        IntentEntry(date: Date(), configuration: WidgetThemeIntent())
    }

    func getSnapshot(for configuration: WidgetThemeIntent, in context: Context, completion: @escaping (IntentEntry) -> ()) {
        let entry = IntentEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: WidgetThemeIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [IntentEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 1 ..< 10 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset * 30, to: currentDate)!
            let entry = IntentEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
