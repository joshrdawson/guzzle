//
//  ProfilePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct ProfilePageView: View {
	@FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile>
	@FetchRequest(entity: Achievement.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var achievements: FetchedResults<Achievement>
	@Environment(\.managedObjectContext) var moc
	var activityLevels = ["Inactive", "Light", "Average", "Active"]
	var genders = ["Male", "Female", "Other"]
	@State var suggestedGoal:String = ""
	@State var name: String = ""
	@State var age: String = ""
	@State var gender: String = "Male"
	@State var weight: String = ""
	@State var activityLevel: String = "Average"
	
	
	var body: some View {
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
					Image(gender == "Female" ? "avatar-female" : "avatar-male")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding(.horizontal, 20)
						.frame(width: 150, height: 150)
						.shadow(radius: 5)
					Spacer()
				}
				HStack {
					VStack {
						VStack(alignment: .leading, spacing: 10) {
							VStack(alignment: .leading, spacing: 10) {
								HStack {
									Text("Name: ")
										.font(.system(size: 20))
									TextField("Enter name", text: $name)
								}
								
								Divider()
								
								HStack {
									Text("Age: ")
										.font(.system(size: 20))
									TextField("Enter age", text: $age)
								}
								
								Divider()
								
								HStack {
									Text("Gender: ")
										.font(.system(size: 20))
									Picker("Enter gender:", selection: $gender) {
										ForEach(genders, id: \.self) {
											Text($0)
										}
									}
									.frame(width: 150, height: 50)
									.clipped()
									.cornerRadius(50)
								}
								
								Divider()
							}
							
							HStack {
								Text("Weight (kg): ")
									.font(.system(size: 20))
								TextField("Enter weight", text: $weight)
							}
							
							Divider()
							
							HStack {
								Text("Activity Level: ")
									.font(.system(size: 20))
								Picker("Enter activity level", selection: $activityLevel) {
									ForEach(activityLevels, id: \.self) {
										Text($0)
									}
								}
								.frame(width: 150, height: 50)
								.clipped()
								.cornerRadius(50)
							}
							
							HStack {
								Button(action: {
									do {
										profile[0].name = name
										profile[0].age = age
										profile[0].gender = gender
										profile[0].weight = weight
										profile[0].activityLevel = activityLevel
										try self.moc.save()
										suggestedGoal = String(format: "%.2f", calculateSuggestedGoal(person: profile))
										profile[0].suggestedGoal = suggestedGoal
										achievements[3].progress = 1
										try self.moc.save()
									} catch {
										print("error saving profile")
									}
								}, label: {
									Text("Save Profile")
										.font(.system(size: 20))
										.foregroundColor(.blue)
								})
								.padding(.top, 10)
								Spacer()
							}
							
							
							Text("Suggested Goal: \(suggestedGoal == "" ? "2.5" : suggestedGoal)L")
								.bold()
								.font(.system(size: 25))
								.padding(.top, 5)
						}
						.foregroundColor(.white)
						Text("Note: The suggested goal is based on your age, gender, weight and activity level. Actual reccomended daily intake may vary.")
							.font(.system(size: 10))
							.frame(minHeight: 35)
							.foregroundColor(.gray)
					}
					.font(.system(size: 25))
					.padding(.horizontal, 25)
					Spacer()
				}
				Spacer()
			}
		}
		.onAppear(perform: {
			// load newest saved values 
			name = profile[0].name!
			age = profile[0].age!
			suggestedGoal = profile[0].suggestedGoal!
			gender = profile[0].gender!
			weight = profile[0].weight!
			activityLevel = profile[0].activityLevel!
		})
	}
	
}


struct ProfilePageView_Previews: PreviewProvider {
	static var previews: some View {
		ProfilePageView()
	}
}

func calculateSuggestedGoal(person: FetchedResults<Profile>) -> Float {
	let user = person[0]
	
	if(user.name != "") {
		var total: Float = 0
		
		if(user.gender == "Male") {
			total += 3.5
		} else {
			total += 3
		}
		
		switch user.activityLevel {
		case "Inactive":
			total -= 0.5
		case "Light":
			total -= 0.25
		case "Average":
			total += 0.25
		case "Active":
			total += 0.5
		case .none:
			break
		case .some(_):
			break
		}
		return total
	}
	return 2.50
	
	
}
