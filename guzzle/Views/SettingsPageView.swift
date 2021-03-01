//
//  SettingsPageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct SettingsPageView: View {
	@Binding var dailyGoal: Float
	var body: some View {
		VStack {
			HStack {
				Text("Settings")
					.font(.system(size: 40))
					.font(.largeTitle)
					.bold()
					.padding(.horizontal, 30)
					.padding(.top, 45)
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
							Text("Suggested Goal: 3L")
								.font(.footnote)
								.foregroundColor(.gray)
							Spacer()
						}
					}
					.padding(.horizontal, 50)
					.padding(.top, 10)
				}
				
				VStack {
					HStack {
						Text("General")
							.bold()
							.font(.system(size: 37.5))
							.padding(.horizontal, 30)
							.padding(.top, 25)
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
							}
							.padding(.trailing, 15)
						}
						
						Divider()
							.padding(.horizontal, 15)
							.padding([.top, .bottom], 5)
						
					}
				}
				Spacer()
			}
		}
	}
}

struct SettingsPageView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsPageView(dailyGoal: Binding.constant(2))
	}
}
