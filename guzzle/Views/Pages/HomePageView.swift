//
//  HomePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI
import HealthKit

struct HomePageView: View {
	@FetchRequest(entity: Intake.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var intakes: FetchedResults<Intake> // this fetchrequest fetches the water intakes, and sorts them using their ID in ascending order. This means that they will be sorted from day 0 to day 6 for displaying on the screen
	@FetchRequest(entity: Achievement.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var achievements: FetchedResults<Achievement> // this fetchrequest represents the tracking of all achievements
	@FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profile: FetchedResults<Profile> // this fetch request represents the users profile, this is needed to display their goal and target
	@FetchRequest(entity: Settings.entity(), sortDescriptors: []) var settings: FetchedResults<Settings> // this fetch request represents the settings, it is needed for achievement tracking
	@Environment(\.managedObjectContext) var moc // the managedobject context handles the writing to the CoreData model
	@State var todayProgress:Float = 0.0 // this state varaible represents the users progress on the current day, it is a state variable as it changes when they consume more water
	var body: some View {
		VStack {
			HStack {
				Text("guzzle")
					.font(.system(size: 40))
					.font(.largeTitle)
					.bold()
					.padding(.horizontal, 30)
					.foregroundColor(.white)
				Spacer()
			}
			.padding(.top, 40)
			
			VStack {
				HStack {
					Text("Today")
						.font(.system(size: 37.5))
						.bold()
						.padding(.horizontal, 35)
						.foregroundColor(.white)
					Spacer()
				}
				CircularProgressBar(goal: intakes.isEmpty ? 2 : intakes[0].goal, progress: intakes.isEmpty ? 0 : intakes[0].progress)
					.frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) // the circular progress bar represents the today progress and uses the appopriate data from the intakes fetch request
				HStack {
					Text("This week")
						.font(.system(size: 35))
						.bold()
						.padding(.horizontal, 35)
						.padding(.top, 15)
						.frame(width: 230, height: 35)
						.foregroundColor(.white)
					Spacer()
				}
				ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[1].goal, progress: intakes.isEmpty ? 3 : intakes[1].progress) // a progress capsule is a view which represents the intake for a day, because it is using data from a fetch request meaning its optioinal data, there must be backup information which in this case is a goal of 0 and a progress of 3.
				ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[2].goal, progress: intakes.isEmpty ? 3 : intakes[2].progress)
				ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[3].goal, progress: intakes.isEmpty ? 3 : intakes[3].progress)
				ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[4].goal, progress: intakes.isEmpty ? 3 : intakes[4].progress)
				ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[5].goal, progress: intakes.isEmpty ? 3 : intakes[5].progress)
				ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[6].goal, progress: intakes.isEmpty ? 3 : intakes[6].progress)
			}
			.padding(.top, 15)
			Spacer()
		}
		.onAppear(perform: {
			// if it is the first time the app has loaded, populate all core data structures
			do {
				// if there are no intakes (days tracked), then create 6 to represent all data shown on the home screen
				if(intakes.isEmpty) {
					for index in 0...6 {
						let day = Intake(context: self.moc)
						day.id = Float(index)
						day.progress = 0
						day.goal = 2.50 // set the first goal to 2.5 litres
						day.date = Date()
						try self.moc.save() // try to save, the save operation may fail so it is required to be prefaced with a try
					}
				}
				
				// if there are no achievements (the first time the app is loaded), create the core data for all the achievements
				if(achievements.isEmpty) {
					for index in (0...3).reversed() {
						let achievement = Achievement(context: self.moc)
						achievement.id = Float(index)
						achievement.name = ""
						achievement.goal = 0
						achievement.progress = 0
						try self.moc.save()
					}
					// setup achievements
					// achievement 1 - check your achievements
					achievements[0].goal = 1
					achievements[0].progress = 1
					achievements[0].name = "Check your achievements!"
					
					//achievement 2 - Smash your goal by over double
					achievements[1].goal = intakes[0].goal * 2
					achievements[1].progress = todayProgress
					achievements[1].name = "Smash your goal by over double!"
					
					//achievement 3 - Smash your goal by over triple
					achievements[2].goal = intakes[0].goal * 3
					achievements[2].progress = todayProgress
					achievements[2].name = "Smash your goal by over triple!"
					
					// achievement 4 - Create a profile
					achievements[3].goal = 1
					achievements[3].progress = 0
					achievements[3].name = "Create a profile!"
					
					try self.moc.save()
					
					// if there is no user profile, create one
					if(profile.isEmpty) {
						let profile = Profile(context: self.moc)
						profile.suggestedGoal = ""
						profile.activityLevel = "Average" // some values need to be populated for the suggested daily goal algorithm
						profile.age = ""
						profile.name = ""
						profile.gender = "Male" // some values need to be populated for the suggested daily goal algorithm
						profile.weight = ""
						try self.moc.save()
					}
				}
				// if the settings havent been set up yet, create them
				if(settings.isEmpty) {
					let defaultSettings = Settings(context: self.moc)
					defaultSettings.achivements = true
					defaultSettings.suggestedGoal = true
					try self.moc.save()
				}
			} catch {
				print("error initialising core data")
			}
			
			// if its a new day, shift the intakes along
			let currentDate = Date()
			if(!isSameDay(dateX: currentDate, dateY: intakes[0].date!)) {
				for index in (1...5).reversed() {
					intakes[index].id = intakes[index-1].id + 1
					intakes[index].date = intakes[index-1].date
					intakes[index].progress = intakes[index-1].progress
					intakes[index].goal = intakes[index-1].goal
				}
				intakes[0].id = 0
				intakes[0].date = Date()
				intakes[0].progress = 0
				intakes[0].goal = Float(intakes[1].goal)
				try? self.moc.save()
			}
			todayProgress = intakes[0].progress // ensure todayProgress is the latest progress
		})
	}
}

struct HomePageView_Previews: PreviewProvider {
	static var previews: some View {
		HomePageView(todayProgress: 0.5).colorScheme(.dark)
	}
}

func isSameDay(dateX: Date, dateY: Date) -> Bool { // a function which returns true if the two specified Date objects are in the same day
	let difference = Calendar.current.dateComponents([.day], from: dateX, to: dateY)
	if difference.day == 0 {
		return true
	} else {
		return false
	}
}
