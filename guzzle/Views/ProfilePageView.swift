//
//  ProfilePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct ProfilePageView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Me")
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

struct ProfilePageView_Previews: PreviewProvider {
	static var previews: some View {
		ProfilePageView()
	}
}
