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
			ZStack {
				VStack {
					HStack {
						Text(tabName)
							.font(.system(size: 40))
							.font(.largeTitle)
							.bold()
							.padding(.horizontal, 30)
							.padding(.top, 45)
						Spacer()
					}
					Rectangle()
						.foregroundColor(Color("pageBackground")).cornerRadius(55)
						.shadow(radius: 3)
				}
				Text("This is the \(tabName) view")
			}
	}
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
		PageView(tabName: "guzzle")
    }
}
