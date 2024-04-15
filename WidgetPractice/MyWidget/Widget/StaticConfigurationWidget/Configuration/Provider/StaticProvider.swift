//
//  StaticProvider.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import SwiftUI
import WidgetKit

struct StaticProvider: TimelineProvider {
    func placeholder(in context: Context) -> StaticEntry {
        StaticEntry(date: .now)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (StaticEntry) -> Void) {
        completion(StaticEntry(date: .now))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<StaticEntry>) -> Void) {
        var entries: [StaticEntry] = []
        
        let currentDate = Date()
        
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = StaticEntry(date: entryDate)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        completion(timeline)
    }
    
    typealias Entry = StaticEntry
    
    
}
