//
//  HomePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

struct HomePageView: View {
	@Binding var todayProgress:Float
	var body: some View {
		VStack {
			HStack {
				Text("guzzle.")
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
					.padding(.horizontal, 20)
					.shadow(radius: 3)
				// page contents
				VStack {
					HStack {
						Text("Today")
							.font(.system(size: 37.5))
							.bold()
							.padding(.horizontal, 45)
							.padding(.top, 30)
						Spacer()
					}
					CircularProgressBar(progress: $todayProgress)
						.frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					HStack {
						Text("This week")
							.font(.system(size: 35))
							.bold()
							.padding(.horizontal, 45)
							.padding(.top, 15)
						Spacer()
					}
					ProgressCapsule(target: Binding.constant(2), progress: Binding.constant(0.2))
					ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.5))
					ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(1))
					ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.25))
					ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.75))
					ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.15))
					Spacer()
				}
			}
		}
	}
}

struct HomePageView_Previews: PreviewProvider {
	static var previews: some View {
		HomePageView(todayProgress: Binding.constant(0.1))
	}
}
