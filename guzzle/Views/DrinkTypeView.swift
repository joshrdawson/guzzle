//
//  DrinkTypeView.swift
//  guzzle
//
//  Created by Josh on 26/02/2021.
//

import SwiftUI

struct DrinkTypeView: View {
	let drinkType: String
	let color: Color
    var body: some View {
		ZStack {
			Rectangle()
				.frame(width: 175, height: 75)
				.foregroundColor(Color("awardBackground").opacity(0.5))
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
		DrinkTypeView(drinkType: "Water", color: .blue)
    }
}
