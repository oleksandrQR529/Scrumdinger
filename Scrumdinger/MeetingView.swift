//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Саша Дранчук on 25.01.2021.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    // MARK:- Variables
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    // MARK:- Views
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, scrumColor: scrum.color)
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.startScrum()
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
            .previewDevice("iPhone 12")
    }
}
