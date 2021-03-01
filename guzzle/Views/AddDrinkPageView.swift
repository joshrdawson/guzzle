//
//  AddDrinkPageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct AddDrinkPageView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Add Drink")
					.font(.system(size: 40))
					.font(.largeTitle)
					.bold()
					.padding(.horizontal, 30)
					.padding(.top, 45)
				Spacer()
			}
			VStack {
				HStack {
					DrinkTypeView(drinkType: "Water", color: .blue)
						.padding(.trailing, 10)
					DrinkTypeView(drinkType: "Tea", color: Color(.brown))
				}
				.padding(.bottom, 35)
				HStack {
					DrinkTypeView(drinkType: "Coffee", color: Color(.brown))
						.padding(.trailing, 10)
					DrinkTypeView(drinkType: "Milk", color: .white)
				}
				.padding(.bottom, 35)
				HStack {
					DrinkTypeView(drinkType: "Other", color: .green)
				}
				.padding(.bottom, 35)
				ZStack {
					Capsule()
						.size(width: 350, height: 55)
						.frame(width: 350, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
						.foregroundColor(Color("awardBackground").opacity(0.5))
					Text("450ml")
						.foregroundColor(.gray)
						.font(.system(size: 20))
						.padding(.leading, 250)
						
					HStack {
						ZStack {
							Capsule()
								.size(width: 150, height: 55)
								.frame(width: 150, height: 55)
								.foregroundColor(Color("awardBackground").opacity(0.6))
								.padding(.trailing, 200)
								.shadow(radius: 3)
							Text("Amount: ")
								.font(.system(size: 25))
								.padding(.trailing, 200)
								.shadow(radius: 2)
						}
					}
				}
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
					ZStack {
						Capsule()
							.size(width: 125, height: 55)
							.frame(width: 125, height: 55, alignment: .leading)
							.padding(.trailing, 225)
							.padding(.top, 20)
							.foregroundColor(.green)
						Text("Add")
							.font(.system(size: 25))
							.padding(.trailing, 223)
							.padding(.top, 18)
							.foregroundColor(.white)
					}
				})
				Spacer()
			}
			.padding(.top, 30)
		}
	}
}

struct AddDrinkPageView_Previews: PreviewProvider {
	static var previews: some View {
		AddDrinkPageView()
	}
}
