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
			ZStack {
				Rectangle()
					.foregroundColor(Color("pageBackground")).cornerRadius(55)
					.padding(.horizontal, 10)
					.shadow(radius: 3)
				// page contents
				VStack {

				}
			}
		}
	}
}

struct AddDrinkPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddDrinkPageView()
    }
}
