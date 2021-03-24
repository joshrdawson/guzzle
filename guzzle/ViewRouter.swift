//
//  ViewRouter.swift
//  guzzle
//
//  Created by Josh on 11/02/2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
	@Published var currentTab: Page = .me
}

enum Page {
	case home
	case me
	case awards
	case settings
	case add
}
