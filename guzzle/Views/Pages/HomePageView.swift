//
//  HomePageView.swift
//  guzzle
//
//  Created by Josh on 13/02/2021.
//

import SwiftUI
import CoreData

struct HomePageView: View {
	@FetchRequest(entity: Intake.entity(), sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]) var intakes: FetchedResults<Intake>
	@Environment(\.managedObjectContext) var moc
	@State var todayProgress:Float = 0.0
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
				.padding(.top, 45)
				
				VStack {
					HStack {
						Text("Today")
							.font(.system(size: 37.5))
							.bold()
							.padding(.horizontal, 35)
							.foregroundColor(.white)
						Spacer()
					}
					CircularProgressBar(goal: intakes.isEmpty ? 2 : intakes[0].goal, progress: $todayProgress)
						.frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
					ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[1].goal, progress: intakes.isEmpty ? 3 : intakes[1].progress)
					ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[2].goal, progress: intakes.isEmpty ? 3 : intakes[2].progress)
					ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[3].goal, progress: intakes.isEmpty ? 3 : intakes[3].progress)
					ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[4].goal, progress: intakes.isEmpty ? 3 : intakes[4].progress)
					ProgressCapsule(goal: intakes.isEmpty ? 0 : intakes[5].goal, progress: intakes.isEmpty ? 3 : intakes[5].progress)
				}
				.padding(.top, 15)
				Spacer()
			}
		.onAppear(perform: {
			do {
				if(intakes.isEmpty) {
					for index in 0...5 {
						let day = Intake(context: self.moc)
						day.id = Float(index)
						day.progress = 0
						day.goal = 2
						day.date = Date()
						try? self.moc.save()
					}
				}
			} catch {
				print("error initialising intakes")
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
				intakes[0].goal = 2
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

func isSameDay(dateX: Date, dateY: Date) -> Bool {
	let difference = Calendar.current.dateComponents([.day], from: dateX, to: dateY)
	if difference.day == 0 {
		return true
	} else {
		return false
	}
}
