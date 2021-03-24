//
//  AddDrinkPageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AddDrinkPageView: View {
	@FetchRequest(entity: Achievement.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var achievements: FetchedResults<Achievement>
	@FetchRequest(entity: Intake.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var intakes: FetchedResults<Intake>
	@Environment(\.managedObjectContext) var moc
	@State var currentClicked: String = ""
	@State var amount: String = ""
	var body: some View {
		ZStack {
			VStack {
				HStack {
					Text("Add Drink")
						.font(.system(size: 40))
						.font(.largeTitle)
						.bold()
						.padding(.horizontal, 30)
						.padding(.top, 45)
						.foregroundColor(.white)
					Spacer()
				}
				VStack {
					HStack {
						ZStack {
							DrinkTypeView(drinkType: "Water", color: .blue, currentClicked: $currentClicked)
								.padding(.trailing, 10)
							Button(action: {
								currentClicked = "Water"
								print(currentClicked)
							}, label: {
								Text("")
									.frame(width: 175, height: 100)
							})
						}
						
						ZStack {
							DrinkTypeView(drinkType: "Tea", color: Color(.brown), currentClicked: $currentClicked)
							Button(action: {
								currentClicked = "Tea"
								print(currentClicked)
							}, label: {
								Text("")
									.frame(width: 175, height: 100)
							})
						}
						
					}
					.padding(.bottom, 15)
					
					HStack {
						ZStack {
							DrinkTypeView(drinkType: "Coffee", color: Color(.brown), currentClicked: $currentClicked)
								.padding(.trailing, 10)
							Button(action: {
								currentClicked = "Coffee"
								print(currentClicked)
							}, label: {
								Text("")
									.frame(width: 175, height: 100)
							})
						}
						
						
						ZStack {
							DrinkTypeView(drinkType: "Milk", color: .white, currentClicked: $currentClicked)
							Button(action: {
								currentClicked = "Milk"
								print(currentClicked)
							}, label: {
								Text("")
									.frame(width: 175, height: 100)
							})
						}
					}
					.padding(.bottom, 15)
					
					
					HStack {
						ZStack {
							DrinkTypeView(drinkType: "Other", color: .green, currentClicked: $currentClicked)
							Button(action: {
								currentClicked = "Other"
								print(currentClicked)
							}, label: {
								Text("")
									.frame(width: 175, height: 100)
							})
						}
					}
					.padding(.bottom, 15)
					ZStack {
						Capsule()
							.size(width: 350, height: 55)
							.frame(width: 350, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
							.foregroundColor(Color("awardBackground").opacity(0.5))
						TextField("450ml", text: $amount)
							.keyboardType(.numberPad)
							.foregroundColor(.gray)
							.font(.system(size: 20))
							.padding(.leading, 300)
						
						HStack {
							ZStack {
								Capsule()
									.size(width: 150, height: 55)
									.frame(width: 150, height: 55)
									.foregroundColor(Color("awardBackground").opacity(0.6))
									.padding(.trailing, 200)
									.shadow(radius: 3)
								Text("Amount (ml):")
									.font(.system(size: 22))
									.padding(.trailing, 200)
									.shadow(radius: 2)
									.foregroundColor(.white)
							}
						}
					}
					
					Button(action: {
						do {
							let unwrapped = Float(amount) ?? 0
							intakes[0].progress += unwrapped / 1000
							try self.moc.save()
							hideKeypad()
							amount = ""
							// update any achievments which may have changed from adding a drink
							// achivement 2 - smash your goal by over double
							if(achievements[1].progress < achievements[1].goal) { // if achicement not achieved, then update. This stops you having to earn achievements every day
								achievements[1].goal = intakes[0].goal * 2
								achievements[1].progress = intakes[0].progress
							}
							
							//achievement 3 - smash your goal by over triple
							if(achievements[2].progress < achievements[2].goal) {
								achievements[2].goal = intakes[0].goal * 3
								achievements[2].progress = intakes[0].progress
							}
							
							try moc.save()
						} catch {
							print("error adding drink")
						}
					}, label: {
						ZStack {
							Capsule()
								.size(width: 125, height: 55)
								.frame(width: 125, height: 55, alignment: .leading)
								
								.foregroundColor(.blue)
							Text("Add")
								.font(.system(size: 25))
								.foregroundColor(.white)
						}
						.padding(.top, 10)
					})
					.padding(.trailing, 225)
					.frame(width: 150)
					Spacer()
				}
				.padding(.top, 30)
			}
		}
	}
}

struct AddDrinkPageView_Previews: PreviewProvider {
	static var previews: some View {
		AddDrinkPageView(currentClicked: "Water", amount: "450ml")
	}
}

extension View {
	func hideKeypad() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
