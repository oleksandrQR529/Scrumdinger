//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Саша Дранчук on 29.01.2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    // MARK:- Variables
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    let scrumColor: Color
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    ///Computed property for VoiceOver
    private var minutesRemaining: Int {
        return secondsRemaining / 60
    }
    ///Computed property for VoiceOver
    private var minutesRemainingMetric: String {
        return minutesRemaining == 1 ? "minute" : "minutes"
    }
    // MARK:- Views
    
    var body: some View {
        VStack {
        ProgressView(value: progress)
            .progressViewStyle(ScrumProgressViewStyle(scrumColor: scrumColor))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondsRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, scrumColor: DailyScrum.data[0].color)
            .previewDevice("iPhone 12")
            .previewLayout(.sizeThatFits)
    }
}
