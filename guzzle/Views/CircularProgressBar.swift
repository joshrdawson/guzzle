//
//  CircularProgressBar.swift
//  guzzle
//
//  Created by Josh on 25/02/2021.
//  Adapts the following tutorial to work with this use case: https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
//

import SwiftUI

struct CircularProgressBar: View { // this view represents the circular progress bar which shows the current days water intake
	var goal:Float // represents the daily goal
	var progress:Float // represents the progress so far
	var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: 17.0)
				.opacity(0.3)
				.foregroundColor(.blue)
			
			Circle()
				.trim(from: 0.0, to: CGFloat(min((progress / goal), 1.0)))
				.stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
				.foregroundColor(.blue)
				.rotationEffect(Angle(degrees: 270.0))
				.animation(.linear)
			Text(String(format: "%.0f %%", (progress / goal) * 100.0)) // format the progress percentage to a whole number
				.font(.largeTitle)
				.bold()
				.foregroundColor(.white)
		}
	}
}

struct CircularProgressBar_Previews: PreviewProvider {
	static var previews: some View {
		CircularProgressBar(goal: 2, progress: 0)
	}
}
