//
//  DrinkTypeView.swift
//  guzzle
//
//  Created by Josh on 26/02/2021.
//

import SwiftUI

struct DrinkTypeView: View { // this view represents the different drink types availible to add from the AddDrinkPageView
	let drinkType: String // stores the name of the drink
	let color: Color // stores the colour of the icon for the drink (i.e blue for water and brown for coffee)
	@Binding var currentClicked: String // stores the clickedStatus of the drink (i.e if the button is clicked)
    var body: some View {
		ZStack {
			Rectangle()
				.frame(width: 150, height: 70)
				.foregroundColor(Color("awardBackground").opacity(currentClicked == drinkType ? 1 : 0.5)) // if the drink is currently clicked, make it less opaque. this results in a darker button, showing the user which drink is currently selected. The currentClicked variable is binding meaning that it will re-render when changed.
				.cornerRadius(20)
				.shadow(radius: 3)
			Button(action: {}, label: {
				Image(systemName: "drop.fill")
					.foregroundColor(color)
					.font(.system(size: 45))
					.padding(.trailing, 10)
				Text(drinkType)
					.foregroundColor(.white)
					.font(.system(size: 25))
					.multilineTextAlignment(.center)
			})
			.frame(width: 150, height: 50)
		}
    }
}

struct DrinkTypeView_Previews: PreviewProvider {
    static var previews: some View {
		DrinkTypeView(drinkType: "Water", color: .blue, currentClicked: Binding.constant("Water"))
    }
}

