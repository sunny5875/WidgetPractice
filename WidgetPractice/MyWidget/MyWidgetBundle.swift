//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by 현수빈 on 4/15/24.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyStaticWidget()
        IntentWidget()
        MyWidgetLiveActivity()
    }
}
