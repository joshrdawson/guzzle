//
//  AwardView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AwardView: View {
	@Binding var award: Award
	var body: some View {
		VStack {
			ZStack {
				Image(systemName: "hexagon.fill")
					.font(.system(size: 140))
				Image(systemName: award.awardIcon)
					.foregroundColor(award.complete ? .yellow : .black)
					.font(.system(size: 65))
			}
			Text("\(award.awardName) - \(award.getPercentageProgress())")
				.font(.system(size: 22.5))
		}
	}
}

struct AwardView_Previews: PreviewProvider {
	static var previews: some View {
		AwardView(award: Binding.constant(Award(awardIcon: "rosette", awardName: "Test Award", description: "This is the test award", currentProgress: 25, target: 140)))
	}
}
