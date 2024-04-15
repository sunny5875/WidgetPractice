//
//  UserDefaults+.swift
//  WidgetPractice
//
//  Created by 현수빈 on 4/15/24.
//

import Foundation


public enum UserDefaultKey: String {
    case salary
    case showSalary
    case startTime
    case endTime
}


extension UserDefaults {
    static let groupUserDefault: UserDefaults = UserDefaults(suiteName: "group.sunny.widgetGroup")! // widget과 함께 쓰기 위해 app group용 userdefault 생성
}
