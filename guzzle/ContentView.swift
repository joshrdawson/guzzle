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
		GeometryReader { geometry in
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
					TabBar(viewRouter: viewRouter, assignedPage: .home, width: 90, height: 35, systemIcon: "house", tabName: "Home")
					
					TabBar(viewRouter: viewRouter, assignedPage: .me, width: 90, height: 35, systemIcon: "person", tabName: "Me")
					
					ZStack {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 70)
							.foregroundColor(Color.blue)
					}.offset(y: -60)
					
					TabBar(viewRouter: viewRouter, assignedPage: .awards, width: 90, height: 35, systemIcon: "rosette", tabName: "Awards")
					
					TabBar(viewRouter: viewRouter, assignedPage: .settings, width: 90, height: 35, systemIcon: "gear", tabName: "Settings")
				}
				.frame(width: geometry.size.width, height: geometry.size.height/8)
				.background(Color.black.opacity(0.05)).shadow(radius: 1)
			}
			.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
		}
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

struct TabBar: View {
	@StateObject var viewRouter: ViewRouter
	let assignedPage: Page
	let width, height: CGFloat
	let systemIcon, tabName: String
	var body: some View {
		VStack {
			Image(systemName: systemIcon).resizable().aspectRatio(contentMode: .fit)
				.frame(width: width, height: height)
				.padding(.top, 10)
			Text(tabName).font(.footnote)
			Spacer()
		}
		.onTapGesture{
			viewRouter.currentTab = assignedPage
		}
		.padding(.horizontal, -4)
	}
}
