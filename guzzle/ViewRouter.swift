//
//  ViewRouter.swift
//  guzzle
//
//  Created by Josh on 11/02/2021.
//

import SwiftUI

class ViewRouter: ObservableObject { // this class represents the ViewRouter which stores the current selcted page
	@Published var currentTab: Page = .home
}

enum Page { // this enum represents the different pages that could be displayed
	case home
	case me
	case awards
	case settings
	case add
}
