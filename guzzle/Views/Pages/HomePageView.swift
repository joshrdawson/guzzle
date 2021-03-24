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
		ZStack {
			//			Rectangle()
			//				.foregroundColor(.black)
			//				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack {
				HStack {
					Text("guzzle.")
						.font(.system(size: 40))
						.font(.largeTitle)
						.bold()
						.padding(.horizontal, 30)
						.padding(.top, 20)
					Spacer()
				}
				VStack {
					HStack {
						Text("Today")
							.font(.system(size: 37.5))
							.bold()
							.padding(.horizontal, 35)
							.padding(.top, 30)
						Spacer()
					}
					CircularProgressBar(goal: intakes[0].goal, progress: $todayProgress)
						.frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					HStack {
						Text("This week")
							.font(.system(size: 35))
							.bold()
							.padding(.horizontal, 35)
							.padding(.top, 15)
							.frame(width: 230, height: 35)
						Spacer()
					}
					ProgressCapsule(goal: intakes[1].goal, progress: intakes[1].progress)
					ProgressCapsule(goal: intakes[2].goal,progress: intakes[2].progress)
					ProgressCapsule(goal: intakes[3].goal,progress: intakes[3].progress)
					ProgressCapsule(goal: intakes[4].goal,progress: intakes[4].progress)
					ProgressCapsule(goal: intakes[5].goal,progress: intakes[5].progress)
					ProgressCapsule(goal: intakes[6].goal,progress: intakes[6].progress)
					//					List {
					//						ForEach(intakes, id: \.id) { intake in
					//							Text("\(intake.progress)")
					//						}
					//					}
				}
			}
		}
		.onAppear(perform: {
			print("NEW HOME")
			for intake in intakes {
				print(intake.id)
			}
			let currentDate = Date()
			if(!isSameDay(dateX: currentDate, dateY: intakes[0].date!)) {
				print("not same")
				for index in (1...6).reversed() {
//					print(intakes[index-1].id, intakes[index-1].date!, intakes[index-1].progress, intakes[index-1].goal)
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
			todayProgress = intakes[0].progress
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
