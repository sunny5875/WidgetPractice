//
//  ContentView.swift
//  WidgetPractice
//
//  Created by 현수빈 on 4/15/24.
//

import SwiftUI


struct ContentView: View {
    @State var salary: String = ""
    @State var startTime: Date = .now
    @State var endTime: Date = .now
    @State var showSalary: Bool = false
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField(text: $salary, label: {
                    Text("월급액(백만원 기준)을 적어주세요.")
                })
                .keyboardType(.numberPad)
                
                DatePicker(
                    "출근 시간",
                    selection: $startTime,
                    displayedComponents: [.hourAndMinute]
                )
                DatePicker(
                    "퇴근 시간",
                    selection: $endTime,
                    displayedComponents: [.hourAndMinute]
                )
                
                Toggle(isOn: $showSalary, label: {
                    Text("위젯에 오늘 번 돈 보이기")
                })
                
                Button(action: {
                    UserDefaults.groupUserDefault.setValue(salary + "0000", forKey: UserDefaultKey.salary.rawValue)
                    UserDefaults.groupUserDefault.setValue(startTime, forKey: UserDefaultKey.startTime.rawValue)
                    UserDefaults.groupUserDefault.setValue(endTime, forKey: UserDefaultKey.endTime.rawValue)
                    UserDefaults.groupUserDefault.setValue(showSalary, forKey: UserDefaultKey.showSalary.rawValue)
                }, label: {
                    Text("저장하기")
                        .frame(height: 100)
                })
            }
            .onAppear {
                onAppear()
            }
            .navigationBarTitle(Text("하루 출퇴근 위젯 설정"))
        }
    }
    
    
    func onAppear() {
        self.salary = UserDefaults.groupUserDefault.string(forKey: UserDefaultKey.salary.rawValue) ?? "0000"
        self.salary = String(salary.dropLast(4))
        self.showSalary = UserDefaults.groupUserDefault.bool(forKey: UserDefaultKey.showSalary.rawValue)
        self.startTime = UserDefaults.groupUserDefault.object(forKey: UserDefaultKey.startTime.rawValue) as? Date ?? .now
        self.endTime = UserDefaults.groupUserDefault.object(forKey: UserDefaultKey.endTime.rawValue) as? Date ?? .now
    }
}
