//
//  guzzleApp.swift
//  guzzle
//
//  Created by Josh on 04/02/2021.
//

import SwiftUI

@main
struct guzzleApp: App {
	@StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
			ContentView(viewRouter: viewRouter)
        }
    }
}
