//
//  ProgressCapsule.swift
//  guzzle
//
//  Created by Josh on 25/02/2021.
//

import SwiftUI

struct ProgressCapsule: View {
	@Binding var target:Int
	@Binding var progress:Float
    var body: some View {
		VStack {
			ZStack {
				Capsule()
					.size(width: 325, height: 15)
					.frame(width: 325, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				HStack {
					Capsule()
						.size(width: CGFloat(325 * progress) + 10, height: 15)
						.frame(width: CGFloat(325 * progress) + 10, height: 15, alignment: .leading)
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
						.padding(.horizontal, 45)
					Spacer()
				}
			}
			HStack {
				Spacer()
				Text("\(String(format: "%.1f", Float(target) * progress))L")
					.bold()
				Spacer(minLength: 275)
				Text("\(String(format: "%.1f", Float(target)))L")
					.bold()
				Spacer()
			}
		}
    }
}

struct ProgressCapsule_Previews: PreviewProvider {
    static var previews: some View {
		ProgressCapsule(target: Binding.constant(2), progress: Binding.constant(0.3))
    }
}