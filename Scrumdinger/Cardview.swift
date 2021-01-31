//
//  Cardview.swift
//  Scrumdinger
//
//  Created by Саша Дранчук on 25.01.2021.
//

import SwiftUI

struct Cardview: View {
    // MARK:- Variables
    let scrum: DailyScrum
    
    // MARK:- Views
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting length"))
                    .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct Cardview_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        Cardview(scrum: scrum)
            .previewDevice("iPhone 12")
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
