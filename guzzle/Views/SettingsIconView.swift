//
//  SettingsIconView.swift
//  guzzle
//
//  Created by Josh on 01/03/2021.
//

import SwiftUI

struct SettingsIconView: View { // this view represents the small icon shown with each different setting toggle
	var iconName: String // represents the appropriate SF Symbol
	var body: some View {
		ZStack {
			Rectangle()
				.size(width: 40, height: 40)
				.frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				.cornerRadius(12)
				.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			Image(systemName: iconName) // use the supplied SF Symbol name to load the image
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				.foregroundColor(.white)
		}
		.shadow(radius: 2)
	}
}

struct SettingsIconView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsIconView(iconName: "bell")
	}
}
