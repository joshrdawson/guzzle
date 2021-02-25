//
//  PageView.swift
//  guzzle
//
//  Created by Josh on 12/02/2021.
//

import SwiftUI

struct PageView: View {
	let tabName: String
	@State var progress: Float = 10
    var body: some View {
			ZStack {
				VStack {
					HStack {
						Text(tabName)
							.font(.system(size: 40))
							.font(.largeTitle)
							.bold()
							.padding(.horizontal, 30)
							.padding(.top, 25)
						Spacer()
					}
					Rectangle()
						.foregroundColor(Color("pageBackground")).cornerRadius(55)
						.padding(.horizontal, 10)
						.shadow(radius: 3)
				}
				VStack {
					Button(action: {
						progress = progress + 0.01
					}, label: {
						/*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
					})
					CircularProgressBar(progress: $progress)
				}
			}
	}
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
		PageView(tabName: "guzzle", progress: 0.3)
    }
}
