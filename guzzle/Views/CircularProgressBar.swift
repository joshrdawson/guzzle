//
//  CircularProgressBar.swift
//  guzzle
//
//  Created by Josh on 25/02/2021.
//

import SwiftUI

struct CircularProgressBar: View {
	@Binding var progress:Float
	var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: 20.0)
				.opacity(0.3)
				.foregroundColor(.blue)
			
			Circle()
				.trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
				.stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
				.foregroundColor(.blue)
				.rotationEffect(Angle(degrees: 270.0))
				.animation(.linear)
			Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
				.font(.largeTitle)
				.bold()
		}
	}
}

struct CircularProgressBar_Previews: PreviewProvider {
	static var previews: some View {
		CircularProgressBar(progress: Binding.constant(0.3))
	}
}
