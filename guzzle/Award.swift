//
//  Award.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI

final class Award {
	let awardIcon: String
	let awardName: String
	let currentProgress: Double
	let target: Double
	var complete: Bool
	
	init(awardIcon: String, awardName: String, description: String, currentProgress: Double, target: Double) {
		self.awardIcon = awardIcon
		self.awardName = awardName
		self.currentProgress = currentProgress
		self.target	= target
		self.complete = false
	}
	
	func getPercentageProgress() -> String {
		return "\(floor((currentProgress / target) * 100))%"
	}
	
	
}
