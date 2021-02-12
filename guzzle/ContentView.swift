//
//  ContentView.swift
//  guzzle
//
//  Created by Josh on 04/02/2021.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewRouter: ViewRouter
	var body: some View {
			VStack {
				Spacer()
				switch viewRouter.currentTab {
				case .home:
					Text("Home")
				case .me:
					Text("Me")
				case .awards:
					Text("Awards")
				case .settings:
					Text("Settings")
				}
				
				Spacer()
				
				HStack {
					
					HStack {
						Spacer()
						
						BarItem(viewRouter: viewRouter, assignedPage: .home, systemIcon: "house", tabName: "Home")
						
						Spacer()
						
						BarItem(viewRouter: viewRouter, assignedPage: .me, systemIcon: "person", tabName: "Me")
						
						Spacer()
					}
					
					ZStack {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 70)
							.foregroundColor(Color.blue)
					}.offset(y: -60)
					
					HStack {
						Spacer()
						
						BarItem(viewRouter: viewRouter, assignedPage: .awards, systemIcon: "rosette", tabName: "Awards")
						
						Spacer()
						
						BarItem(viewRouter: viewRouter, assignedPage: .settings, systemIcon: "gear", tabName: "Settings")
						
						Spacer()
					}
					
				}
				.background(Color.black.opacity(0.05)).shadow(radius: 1)
			}
			.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(viewRouter: ViewRouter())
	}
}

struct RedView: View {
	var body: some View {
		Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}

struct BlueView: View {
	var body: some View {
		Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}

struct BarItem: View {
	@StateObject var viewRouter: ViewRouter
	let assignedPage: Page
	let systemIcon, tabName: String
	
	var body: some View {
		VStack {
			Image(systemName: systemIcon)
			Text(tabName).font(.footnote)
		}
		.font(.system(size: 37.5))
		.padding(.top, 10)
		.padding(.bottom, 30)
		.onTapGesture {
			viewRouter.currentTab = assignedPage
		}
		
	}
}
