//
//  ProgressCapsule.swift
//  guzzle
//
//  Created by Josh on 25/02/2021.
//

import SwiftUI

struct ProgressCapsule: View {
	var goal:Float
	var progress:Float
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
						.size(width: CGFloat(progress <= goal ? 325 * (progress/goal) : 325) + 10, height: 15)
						.frame(width: CGFloat(progress <= goal ? 325 * (progress/goal) : 325), height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
						.shadow(radius: 2)
					Spacer()
				}
			}
			HStack {
				Spacer()
				Text("\(String(format: "%.1f", progress))L")
					.bold()
				Spacer(minLength: 220)
				Text("\(String(format: "%.1f", Float(goal)))L")
					.bold()
				Spacer()
			}
			.foregroundColor(.white)
		}
		.frame(width: 330, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ProgressCapsule_Previews: PreviewProvider {
    static var previews: some View {
		ProgressCapsule(goal: 2.0, progress: 1.5)
    }
}
