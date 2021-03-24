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
	@Environment(\.managedObjectContext) var moc
	@State var dailyGoal: Double = 2
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
							Text("Daily Goal: \(String(format: "%.1f", dailyGoal))L")
								.font(.system(size: 30))
							Spacer()
						}
						HStack {
							Slider(value: $dailyGoal, in: 1...10, step: 0.5)
						}
						HStack {
							Text("Suggested Goal: \(profile[0].suggestedGoal!)L")
								.font(.footnote)
								.foregroundColor(.gray)
							Spacer()
						}
					}
					.padding(.horizontal, 50)
					.padding(.top, 10)
				}
				.foregroundColor(.white)
				
				HStack {
					Button(action: {
						intakes[0].goal = Float(dailyGoal)
						try? self.moc.save()
					}, label: {
						Text("Save")
							.font(.system(size: 20))
					})
					.padding(.leading, 50)
					.padding(.top, 10)
					Spacer()
				}
				
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
							SettingsIconView(iconName: "bell")
								.padding(.leading, 50)
							Spacer()
							Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
								Text("Reminders")
									.font(.system(size: 25))
									.foregroundColor(.white)
							}
							.padding(.trailing, 15)
						}
						
						Divider()
							.padding(.horizontal, 15)
							.padding([.top, .bottom], 5)
						
						HStack {
							SettingsIconView(iconName: "rosette")
								.padding(.leading, 50)
							Spacer()
							Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
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
							SettingsIconView(iconName: "arrow.up.heart")
								.padding(.leading, 50)
							Spacer()
							Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
								Text("Health Kit Sync")
									.font(.system(size: 25))
									.foregroundColor(.white)
							}
							.padding(.trailing, 15)
						}
						
						Divider()
							.padding(.horizontal, 15)
							.padding([.top, .bottom], 5)
						
					}
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
			dailyGoal = Double(intakes[0].goal)
		})
	}
}

struct SettingsPageView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsPageView()
	}
}
