//
//  ContentView.swift
//  Counter
//
//  Created by Ken Mueller on 10/22/19.
//  Copyright © 2019 Ken Mueller. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State var count = 0
	
    var body: some View {
		VStack {
			Text(String(count))
			Divider()
			HStack {
				AddToCountButton(count: $count, amount: 1)
				AddToCountButton(count: $count, amount: 2)
				AddToCountButton(count: $count, amount: 3)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
