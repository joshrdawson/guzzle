//
//  ProfilePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct ProfilePageView: View {
	var TESTname: String = "Joshua Dawson"
	var TESTage: Int = 21
	var TESTgender: String = "Male"
	var TESTweight: Int = 80
	var TESTactivityLevel: ActivityLevel = .Average
	
	var TESTsuggestedGoal: Int = 3
	var loaded: Bool = false
	
	var activityLevels = ["Inactive", "Light", "Average", "Active"]
	
	var suggestedGoal:Float = 3.0
	@State var name: String = ""
	@State var age: String = ""
	@State var gender: String = ""
	@State var weight: String = ""
	@State var activityLevel: String = ""
	
	enum ActivityLevel: String {
		case Inactive
		case Light
		case Average
		case Active
	}
	
	var body: some View {
		ZStack {
						Rectangle()
							.foregroundColor(.black)
							.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack {
				HStack {
					Text("Me")
						.font(.system(size: 40))
						.font(.largeTitle)
						.bold()
						.padding(.horizontal, 30)
						.foregroundColor(.white)
					Spacer()
				}
				.padding(.top, 45)
				
				VStack {
					HStack {
						Spacer()
						Image(TESTgender == "Male" ? "avatar-male" : "avatar-female")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.padding(.horizontal, 20)
							.frame(width: 250)
							.shadow(radius: 5)
						Spacer()
					}
					HStack {
						VStack(alignment: .leading, spacing: 10) {
							VStack(alignment: .leading, spacing: 10) {
//								HStack {
//									Text("Name: ")
//									TextField("Enter name", text: $name)
//								}
//
//								HStack {
//									Text("Age: ")
//									TextField("Enter age", text: $age)
//								}
//
//								HStack {
//									Text("Gender: ")
//									TextField("Enter gender", text: $gender)
//								}
//
//								HStack {
//									Text("Weight (kg): ")
//									TextField("Enter weight", text: $weight)
//								}
//
//								HStack {
//									Text("Activity Level: ")
//									Picker("Enter activity level", selection: $activityLevel) {
//										ForEach(activityLevels, id: \.self) {
//											Text($0)
//										}
//									}
//									.frame(width: 150)
//									.clipped()
//								}
				
								
								Text("Suggested Goal: \(String(format: "%.1f", Float(suggestedGoal)))L")
									.bold()
									.font(.system(size: 30))
									.padding(.top, 20)
							}
							.foregroundColor(.white)
							Text("Note: The suggested goal is based on your age, gender, weight and activity level. Actual reccomended daily intake may vary.")
								.font(.system(size: 15))
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
}


struct ProfilePageView_Previews: PreviewProvider {
	static var previews: some View {
		ProfilePageView()
	}
}
