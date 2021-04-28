//
//  SettingsPageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct SettingsPageView: View {
	@FetchRequest(entity: Intake.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var intakes: FetchedResults<Intake>
	@FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile>
	@FetchRequest(entity: Settings.entity(), sortDescriptors: []) var settings: FetchedResults<Settings>
	@Environment(\.managedObjectContext) var moc
	
	@State var dailyGoal: Double = 2 // appropriate state variables to store the dynamic UI elements on the settings page
	@State var toggleAchivements: Bool = true
	@State var toggleSuggestedGoal: Bool = true
	var body: some View {
		VStack {
			HStack {
				Text("Settings")
					.font(.system(size: 40))
					.font(.largeTitle)
					.bold()
					.padding(.horizontal, 30)
					.padding(.top, 45)
					.foregroundColor(.white)
				Spacer()
			}
			VStack {
				VStack { // Profile section
					HStack {
						Text("Profile")
							.bold()
							.font(.system(size: 37.5))
							.padding(.horizontal, 30)
							.padding(.top, 25)
						Spacer()
					}
					VStack {
						HStack {
							Text("Daily Goal: \(String(format: "%.2f", dailyGoal))L")
								.font(.system(size: 30))
							Spacer()
						}
						HStack {
							Slider(value: $dailyGoal, in: 1...10, step: 0.25) // slider to select the dailyGoal. this is bound to the state variable dailyGoal. The slider ranges from 1-10 with a step of 0.25. meaning it can hold 1-10 litres and has a step of 250ml.
						}
						HStack {
							Text(settings[0].suggestedGoal ? "Suggested Goal: \(profile[0].suggestedGoal == "" ? "2.5" : profile[0].suggestedGoal!)L" : "") // display the users suggested goal, incase they want guidance on choosing their daily goal.
								.font(.footnote)
								.foregroundColor(.gray)
							Spacer()
						}
					}
					.padding(.horizontal, 50)
					.padding(.top, 10)
				}
				.foregroundColor(.white)
				
				VStack {
					HStack {
						Text("General")
							.bold()
							.font(.system(size: 37.5))
							.padding(.horizontal, 30)
							.padding(.top, 15)
							.foregroundColor(.white)
						Spacer()
					}
					VStack {
						HStack {
							SettingsIconView(iconName: "rosette")
								.padding(.leading, 50)  // this custom view class represents a small settings icon. These icons feature an SF symbol, and have a blue rounded corner background.
							Spacer()
							Toggle(isOn: $toggleAchivements) { // the status of the toggles are binded to their respective state varaibles (ensuring they represent the current status of the toggles)
								Text("Achievements")
									.font(.system(size: 25))
									.foregroundColor(.white)
							}
							.padding(.trailing, 15)
						}
						
						Divider()
							.padding(.horizontal, 15)
							.padding([.top, .bottom], 5)
						
						HStack {
							SettingsIconView(iconName: "target")
								.padding(.leading, 50)
							Spacer()
							Toggle(isOn: $toggleSuggestedGoal) {
								Text("Suggested Goal")
									.font(.system(size: 25))
									.foregroundColor(.white)
							}
							.padding(.trailing, 15)
						}
						
						Divider()
							.padding(.horizontal, 15)
							.padding([.top, .bottom], 5)
						
						HStack {
							SettingsIconView(iconName: "ruler")
								.padding(.leading, 50)
							Text("Units")
								.font(.system(size: 25))
								.foregroundColor(.white)
							Spacer()
							Text("L, Kg")
								.padding(.trailing, 15)
								.font(.system(size: 20))
								.foregroundColor(.gray)
						}
						
						Divider()
							.padding(.horizontal, 15)
							.padding([.top, .bottom], 5)
						
						HStack {
							Button(action: { // save settings button
								do {
									intakes[0].goal = Float(dailyGoal) // Sliders produce strings, so a cast to Float is required before saving to the intakes entity
									settings[0].achivements = toggleAchivements // save the toggles to the users settings
									settings[0].suggestedGoal = toggleSuggestedGoal
									try self.moc.save()
								} catch {
									print("error saving settings")
								}
							}, label: {
								Text("Save Changes")
									.font(.system(size: 20))
							})
							.padding(.leading, 50)
							.padding(.top, 10)
							Spacer()
						}
						
					}
					.padding(.trailing, 15)
				}
				
				Spacer()
				Text("App created by Josh Dawson")
					.font(.system(size: 17.5))
					.foregroundColor(.gray)
					.padding(.bottom, 10)
				Spacer()
			}
		}
		.onAppear(perform: {
			// load the users goal and current settings
			dailyGoal = Double(intakes[0].goal)
			toggleAchivements = settings[0].achivements
			toggleSuggestedGoal = settings[0].suggestedGoal
		})
	}
}

struct SettingsPageView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsPageView()
	}
}
