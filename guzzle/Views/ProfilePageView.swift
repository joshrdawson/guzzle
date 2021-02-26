//
//  ProfilePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct ProfilePageView: View {
	var name: String = "Joshua Dawson"
	var age: Int = 21
	var gender: String = "Male"
	var weight: Int = 80
	var activityLevel: ActivityLevel = .Average
	
	var suggestedGoal: Int = 3
	
	enum ActivityLevel: String {
		case Inactive
		case Light
		case Average
		case Active
	}

	var body: some View {
		VStack {
			HStack {
				Text("Me")
					.font(.system(size: 40))
					.font(.largeTitle)
					.bold()
					.padding(.horizontal, 30)
					.padding(.top, 45)
				Spacer()
			}
			VStack {
				HStack {
					Spacer()
					Image(gender == "Male" ? "avatar-male" : "avatar-female")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding(.horizontal, 20)
						.frame(width: 250)
						.shadow(radius: 5)
					Spacer()
				}
				HStack {
					VStack(alignment: .leading, spacing: 10) {
						Text("Name: \(name)")
						Text("Age: \(age) years old")
						Text("Gender: \(gender)")
						Text("Weight: \(weight)kg")
						Text("Activity Level: \(activityLevel.rawValue)")
						Text("Suggested Goal: \(suggestedGoal)L")
							.bold()
							.font(.system(size: 30))
							.padding(.top, 20)
						Text("Note: The suggested goal is based on your age, gender, weight, activity level and weather. Actual reccomended daily intake may vary.")
							.font(.body)
							.frame(minHeight: 75)
							.foregroundColor(.gray)
					}
					.font(.system(size: 25))
					.padding(.top, 15)
					.padding(.horizontal, 25)
					Spacer()
				}
				Spacer()
			}
		}
	}
}

struct ProfilePageView_Previews: PreviewProvider {
	static var previews: some View {
		ProfilePageView()
	}
}
