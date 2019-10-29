//
//  ContentView.swift
//  Fraction Reducer
//
//  Created by Ken Mueller on 10/22/19.
//  Copyright © 2019 Ken Mueller. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State var input = "a"
	
    var body: some View {
		NavigationView {
			VStack {
				Text("YOUR FRACTION")
					.bold()
					.font(.caption)
					.foregroundColor(.gray)
					.frame(maxWidth: .infinity, alignment: .leading)
				TextField("", text: $input)
				Spacer()
			}
			.padding(.horizontal, 22)
			.padding(.top, 10)
			.navigationBarTitle("Fraction Reducer")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
