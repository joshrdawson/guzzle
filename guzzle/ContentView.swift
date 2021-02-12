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
		VStack { // VStack containing the current tab & navigation bar
			Spacer()
			switch viewRouter.currentTab { // Decide which view to display based on currentTab
			case .home:
				PageView(tabName: "Home")
			case .me:
				PageView(tabName: "Me")
			case .awards:
				PageView(tabName: "Awards")
			case .settings:
				PageView(tabName: "Settings")
			case .add:
				PageView(tabName: "Add Drink")
			}
			
			Spacer()
			
			HStack { // Represents the navigation bar
				
				HStack { // split into two HStack, this being the left side
					Spacer()
					BarItem(viewRouter: viewRouter, assignedPage: .home, systemIcon: "house", tabName: "Home")
					Spacer()
					BarItem(viewRouter: viewRouter, assignedPage: .me, systemIcon: "person", tabName: "Me")
					Spacer( )
				}
				
				PlusBarItem(viewRouter: viewRouter)
								
				HStack {
					Spacer()
					BarItem(viewRouter: viewRouter, assignedPage: .awards, systemIcon: "rosette", tabName: "Awards")
					Spacer()
					BarItem(viewRouter: viewRouter, assignedPage: .settings, systemIcon: "gear", tabName: "Settings")
					Spacer()
				}
			}
			.shadow(radius: 3)
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
			Text(tabName)
				.font(.footnote)
		}
		.font(.system(size: 37.5))
		.padding(.top, 10)
		.padding(.bottom, 40)
		.onTapGesture {
			viewRouter.currentTab = assignedPage
		}
		
	}
}

struct PlusBarItem: View {
	@StateObject var viewRouter: ViewRouter
	var body: some View {
		VStack {
			Image(systemName: "plus.circle.fill")
				.foregroundColor(.blue)
		}
		.font(.system(size: 70))
		.padding(.bottom, 40)
		.offset(y: -25)
		.onTapGesture {
			viewRouter.currentTab = .add
		}
		
	}
}
