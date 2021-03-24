//
//  AwardPageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AwardPageView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Awards")
					.font(.system(size: 40))
					.font(.largeTitle)
					.bold()
					.padding(.horizontal, 30)
					.padding(.top, 45)
					.foregroundColor(.white)
				Spacer()
			}
			VStack {
				HStack {
					AwardView(awardIcon: "7.circle", awardName: "Check your achievements!", currentProgress: 5, target: 10)
					AwardView(awardIcon: "flame.fill", awardName: "Smash your target 2 days in a row!", currentProgress: 3, target: 10)
					AwardView(awardIcon: "2.circle", awardName: "Smash your daily goal by over double!", currentProgress: 9, target: 10)
				}
				.frame(maxHeight: 175)
				HStack {
					AwardView(awardIcon: "flame.fill", awardName: "Smash your goal by over triple!", currentProgress: 3, target: 10)
					AwardView(awardIcon: "calendar", awardName: "Beat your goal for a whole month!", currentProgress: 5, target: 10)
					AwardView(awardIcon: "calendar", awardName: "Beat your target three months!", currentProgress: 9, target: 10)
				}
				.frame(maxHeight: 175)
				HStack {
					AwardView(awardIcon: "camera.filters", awardName: "Log 3 different drink types in 1 day!", currentProgress: 5, target: 10)
					AwardView(awardIcon: "person.crop.circle.fill", awardName: "Create a profile and get daily goal!", currentProgress: 3, target: 10)
				}
				.frame(maxHeight: 175)
				Spacer()
			}
		}
	}
}

struct AwardPageView_Previews: PreviewProvider {
	static var previews: some View {
		AwardPageView()
	}
}
