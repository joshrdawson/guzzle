//
//  AwardView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AwardView: View { // this view class represents an individual award
	let awardIcon: String // this represents the SF Symbol identifier
	let awardName: String // this represents the awards name
	let currentProgress: Float // this represents the current progress in achieving the award
	let target: Float // this represents the target progress of the award (how much is required to unlock it)
	
	var body: some View {
		
		ZStack {
			VStack {
				ZStack {
					Image(systemName: "hexagon.fill") // this hexagon is the background of the award
						.font(.system(size: 80))
						.shadow(radius: 3)
						.foregroundColor(Color("awardBackground")).cornerRadius(55)
					Image(systemName: awardIcon)
						.foregroundColor(currentProgress >= target ? .yellow : Color("pageBackground")) // if the progress is greater than the target (i.e the award is earnt) then set the icon colour to yellow, else use the pageBackground colour preset. 
						.font(.system(size: 50))
						.shadow(radius: 1)
				}
				VStack(spacing: 3) {
					Text(awardName)
						.font(.system(size: 12))
						.frame(minHeight: 20)
						.multilineTextAlignment(.center)
					Text("\(String(format: "%.1f" , ((currentProgress / target) > 1 ? 1 : currentProgress / target) * 100))%") // this text shows the current progress of the award. if the progress is over 100% (i.e the user has drank 2.5x their goal meaning they would have 150% progress on the 2x goal award, it will be capped at 100%).
				}
					.font(.system(size: 10))
				.foregroundColor(.white)
			}
			.frame(width: 115, height: 275)
		}
	}
}

struct AwardView_Previews: PreviewProvider {
	static var previews: some View {
		AwardView(awardIcon: "rosette", awardName: "Download the app!", currentProgress: 15, target: 20).colorScheme(.dark)
	}
}
