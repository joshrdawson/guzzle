//
//  PageView.swift
//  guzzle
//
//  Created by Josh on 12/02/2021.
//

import SwiftUI

struct PageView: View {
	let tabName: String
    var body: some View {
		NavigationView {
				Text("Hello")
			.navigationTitle(tabName)
		}
		.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
		PageView(tabName: "guzzle")
    }
}
