//
//  AwardView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AwardView: View {
	let awardIcon: String
	let awardName: String
	let currentProgress: Double
	let target: Double
	
	var body: some View {
		
		ZStack {
//			Rectangle()
//				.foregroundColor(.black)
//				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack {
				ZStack {
					Image(systemName: "hexagon.fill")
						.font(.system(size: 80))
						.shadow(radius: 3)
						.foregroundColor(Color("awardBackground")).cornerRadius(55)
					Image(systemName: awardIcon)
						.foregroundColor(currentProgress >= target ? .yellow : Color("pageBackground"))
						.font(.system(size: 50))
						.shadow(radius: 1)
				}
				VStack(spacing: 3) {
					Text(awardName)
						.font(.system(size: 12))
						.frame(minHeight: 20)
						.multilineTextAlignment(.center)
					Text("\(String(format: "%.1f" , (currentProgress / target) * 100))%")
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
