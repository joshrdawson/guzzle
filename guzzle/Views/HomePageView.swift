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
					.padding(.top, 20)
				Spacer()
			}
			VStack {
				HStack {
					Text("Today")
						.font(.system(size: 37.5))
						.bold()
						.padding(.horizontal, 35)
						.padding(.top, 30)
					Spacer()
				}
				CircularProgressBar(progress: $todayProgress)
					.frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				HStack {
					Text("This week")
						.font(.system(size: 35))
						.bold()
						.padding(.horizontal, 35)
						.padding(.top, 15)
						.frame(width: 230, height: 35)
					Spacer()
				}
				//TODO: Limit progress bar to 1 even if user drinks more
				ProgressCapsule(target: Binding.constant(2), progress: Binding.constant(0.2))
				ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.5))
				ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(1))
				ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.25))
				ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.75))
				ProgressCapsule(target: Binding.constant(2),progress: Binding.constant(0.15))
			}
		}
	}
}

struct HomePageView_Previews: PreviewProvider {
	static var previews: some View {
		HomePageView(todayProgress: Binding.constant(0.1))
	}
}
