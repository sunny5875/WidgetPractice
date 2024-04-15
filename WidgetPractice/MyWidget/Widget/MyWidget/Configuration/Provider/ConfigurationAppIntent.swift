//
//  ConfigurationAppIntent.swift
//  MyWidget
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import Foundation
import AppIntents


struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "현재 이모지", default: "😃")
    var currentEmoji: String
    
    @Parameter(title: "월급(백만원기준)", default: 0)
    var salary: Int
    
    @Parameter(title: "월급 보이기", default: false)
    var showSalary: Bool
    
    @Parameter(title: "출근 시간", default: "2024-04-15 10:00:00")
    var startDate: String
    
    @Parameter(title: "퇴근 시간", default: "2024-04-15 18:00:00")
    var endDate: String
    
    
    
    init() {
        self.currentEmoji = generateRandomEmoji()
        self.salary = UserDefaults.groupUserDefault.integer(forKey: UserDefaultKey.salary.rawValue)
        
        let startTime = UserDefaults.groupUserDefault.object(forKey: UserDefaultKey.startTime.rawValue) as? Date ?? .now
        let endTime = UserDefaults.groupUserDefault.object(forKey: UserDefaultKey.endTime.rawValue) as? Date ?? .now
        self.startDate = startTime.dateToString()
        self.endDate = endTime.dateToString()
        
        self.showSalary = UserDefaults.groupUserDefault.bool(forKey: UserDefaultKey.showSalary.rawValue)
    }
    
}


extension ConfigurationAppIntent {
    func generateRandomEmoji() -> String {
        let range = 0x1F300...0x1F3F0
        let scalarValue = range.randomElement()!
        let emoji = String(UnicodeScalar(scalarValue)!)
        
        return emoji
    }
}

extension ConfigurationAppIntent: Comparable {
    static func < (lhs: ConfigurationAppIntent, rhs: ConfigurationAppIntent) -> Bool {
        false
    }
    
    static func == (lhs: ConfigurationAppIntent, rhs: ConfigurationAppIntent) -> Bool {
        lhs.showSalary == rhs.showSalary &&
        lhs.salary == rhs.salary &&
        lhs.startDate == rhs.startDate &&
        lhs.endDate == rhs.endDate
    }
    
    func update() {
        UserDefaults.groupUserDefault.setValue("\(self.salary)0000", forKey: UserDefaultKey.salary.rawValue)
        UserDefaults.groupUserDefault.setValue(self.startDate.stringToDate(), forKey: UserDefaultKey.startTime.rawValue)
        UserDefaults.groupUserDefault.setValue(self.endDate.stringToDate(), forKey: UserDefaultKey.endTime.rawValue)
        UserDefaults.groupUserDefault.setValue(self.showSalary, forKey: UserDefaultKey.showSalary.rawValue)
    }
}
