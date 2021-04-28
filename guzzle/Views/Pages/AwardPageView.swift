//
//  AwardPageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AwardPageView: View {
	@FetchRequest(entity: Intake.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var intakes: FetchedResults<Intake>
	@FetchRequest(entity: Achievement.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var achievements: FetchedResults<Achievement>
	@FetchRequest(entity: Settings.entity(), sortDescriptors: []) var settings: FetchedResults<Settings>
	@Environment(\.managedObjectContext) var moc
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
			if(settings[0].achivements) { // only show achievements if the user has them enabled
				VStack {
					HStack {
						AwardView(awardIcon: "7.circle", awardName: achievements[0].name!, currentProgress: achievements[0].progress, target: achievements[0].goal) // AwardView is a custom made view class which represents an award the user can earn.
						AwardView(awardIcon: "2.circle", awardName: achievements[1].name!, currentProgress: achievements[1].progress, target: achievements[1].goal)
						AwardView(awardIcon: "flame.fill", awardName: achievements[2].name!, currentProgress: achievements[2].progress, target: achievements[2].goal)
					}
					.frame(maxHeight: 175)
					HStack {
						AwardView(awardIcon: "person.crop.circle.fill", awardName: achievements[3].name!, currentProgress: achievements[3].progress, target: achievements[3].goal)
					}
					.frame(maxHeight: 175)
					Spacer()
				}
			} else {
				Spacer()
			}

		}
		.onAppear(perform: {
			if(intakes[0].progress == 0) { // if the daily progress = 0, reset the achievment (ensures achievements cant be earnt across multiple days
				if(achievements[1].progress < achievements[1].goal) { // if the progress is less than the goal then the achievement isnt earned (stops it removing achievements)
					achievements[1].progress = 0
				}
				if(achievements[2].progress < achievements[2].goal) {
					achievements[2].progress = 0
				}
				// do not need to check achievement 3 as the achievement is for setting up a profile and that can only happen once as no data is tracked regarding its process. it is binary you either have or havent got a profile. 
			}
		})
	}
}

struct AwardPageView_Previews: PreviewProvider {
	static var previews: some View {
		AwardPageView()
	}
}
