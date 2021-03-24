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
			VStack {
				HStack {
					AwardView(awardIcon: "7.circle", awardName: achievements[0].name!, currentProgress: achievements[0].progress, target: achievements[0].goal)
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
		}
		.onAppear(perform: {
			// update any achievments which may have changed
			// achivement 2 - smash your goal by over double
			if(achievements[1].progress < achievements[1].goal) { // if achicement not achieved, then update. This stops you having to earn achievements every day
				achievements[1].goal = intakes[0].goal * 2
				achievements[1].progress = intakes[0].progress
			}
			
			//achievement 3 - smash your goal by over triple
			if(achievements[2].progress < achievements[2].goal) {
				achievements[2].goal = intakes[0].goal * 3
				achievements[2].progress = intakes[0].progress
			}
		})
	}
}

struct AwardPageView_Previews: PreviewProvider {
	static var previews: some View {
		AwardPageView()
	}
}
