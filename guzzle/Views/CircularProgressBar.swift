//
//  CircularProgressBar.swift
//  guzzle
//
//  Created by Josh on 25/02/2021.
//  Follows this tutorial: https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
//

import SwiftUI

struct CircularProgressBar: View {
	var goal:Float
	@Binding var progress:Float
	var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: 20.0)
				.opacity(0.3)
				.foregroundColor(.blue)
			
			Circle()
				.trim(from: 0.0, to: CGFloat(min((progress / goal), 1.0)))
				.stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
				.foregroundColor(.blue)
				.rotationEffect(Angle(degrees: 270.0))
				.animation(.linear)
			Text(String(format: "%.0f %%", min((progress / goal), 1.0)*100.0))
				.font(.largeTitle)
				.bold()
				.foregroundColor(.white)
		}
	}
}

struct CircularProgressBar_Previews: PreviewProvider {
	static var previews: some View {
		CircularProgressBar(goal: 2, progress: Binding.constant(1.5))
	}
}
