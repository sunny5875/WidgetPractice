//
//  MyWidgetEntryView.swift
//  MyWidgetExtension
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import SwiftUI


struct MyWidgetEntryView : View {
    var entry: SimpleEntry

    var body: some View {
        VStack(spacing: 12 ) {
            HStack {
                Text(entry.configuration.currentEmoji)
                Text(entry.date, style: .time)
                    .dynamicTypeSize(.medium)
                Spacer()
            }
            if entry.configuration.showSalary {
                let money = calculateAmountEarnedToday(
                    salary: entry.configuration.salary,
                    currentHours: entry.date
                )
                if !money.isZero && money.isFinite {
                    HStack {
                        Text("오늘 하루 \(money)원 버는 중💰")
                            .font(.caption)
                        Spacer()
                    }
                }
            }
            HStack {
                Text(getStatus())
                    .italic()
                    .font(.caption)
                Spacer()
            }
            Spacer()
        }
    }
}

private extension MyWidgetEntryView {
    
    func calculateAmountEarnedToday(
        salary: Int,
        currentHours: Date
    ) -> Double {
        guard
            let start = entry.configuration.startDate.stringToDate(),
            let end = entry.configuration.endDate.stringToDate(),
            currentHours.timeIntervalSince(end) < 0
        else { return 0.0 }
        
        let dailyWorkingHours = end.timeIntervalSince(start).tohour
        let monthlyWorkingHours = Double(dailyWorkingHours) * 26.07
        
        let hourlyWage = Double(salary) / monthlyWorkingHours
        
        let startHour = Calendar.current.component(.hour, from: start)
        let currentHour = Calendar.current.component(.hour, from: currentHours)
        
        let workingHours = Double(currentHour - startHour)
        let workingMinutes = Double(Calendar.current.component(.minute, from: currentHours))
        
        let amountEarnedToday = hourlyWage * (workingHours + workingMinutes / 60.0)
        
        return amountEarnedToday
    }

    
    func getStatus(
    ) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let isWeekend = calendar.component(.weekday, from: now) == 1 || calendar.component(.weekday, from: now) == 7
        let currentHour = calendar.component(.hour, from: now)
        
        
        guard
            let start = entry.configuration.startDate.stringToDate(),
            let end =  entry.configuration.endDate.stringToDate()
        else { return "활기찬 활동중!" }
        
        if isWeekend {
            return ("신나는 주말 💓")
        } else if currentHour < calendar.component(.hour, from: start) {
            return ("활기찬 아침 ☀️")
        } else if currentHour >= calendar.component(.hour, from: end) {
            return ("오늘도 고생했어요 🌴")
        } else {
            
            let dailyWorkingHours = end.timeIntervalSince(start).tohour
            
            let remainingHours = (Int(dailyWorkingHours) - 1) - (currentHour - calendar.component(.hour, from: start))
            let remainingMinutes = 60 - calendar.component(.minute, from: now)
            
            if remainingMinutes == 60 {
                return "퇴근까지 \(remainingHours)시간!"
            } else {
                return "퇴근까지 \(remainingHours)시간 \(remainingMinutes)분!"
            }
        }
    }
    
}

