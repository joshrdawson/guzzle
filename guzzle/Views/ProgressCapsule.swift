//
//  ProgressCapsule.swift
//  guzzle
//
//  Created by Josh on 25/02/2021.
//

import SwiftUI

struct ProgressCapsule: View { // this view represents the progress capsule which shows the previous 6 days water intake
	var goal:Float // stores the goal for that specific day
	var progress:Float // stores the progress for that specific day
    var body: some View {
		VStack {
			ZStack {
				Capsule()
					.size(width: 325, height: 15)
					.frame(width: 325, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					.shadow(radius: 2)
					.foregroundColor(.white)
				HStack {
					Capsule()
						.size(width: CGFloat(progress <= goal ? 325 * (progress/goal) : 325) + 10, height: 15) // make the blue capsule's width proportionate to the progress/goal
						.frame(width: CGFloat(progress <= goal ? 325 * (progress/goal) : 325), height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) // adjust the frame according to the capsule width
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
						.shadow(radius: 2)
					Spacer()
				}
			}
			HStack {
				Spacer()
				Text("\(String(format: "%.1f", progress))L") // format the progress to represent 1 decimal place (eg 1/10th of a litre accuracy)
					.bold()
				Spacer(minLength: 220)
				Text("\(String(format: "%.1f", goal))L") // format the goal to represent 1 decimal place (eg 1/10th of a litre accuracy)
					.bold()
				Spacer()
			}
			.foregroundColor(.white)
		}
		.frame(width: 330, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) // align the whole view to the centre, and crop the frame
    }
}

struct ProgressCapsule_Previews: PreviewProvider {
    static var previews: some View {
		ProgressCapsule(goal: 2.0, progress: 1.5)
    }
}
