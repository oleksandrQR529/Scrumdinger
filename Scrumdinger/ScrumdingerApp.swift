//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Саша Дранчук on 25.01.2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
