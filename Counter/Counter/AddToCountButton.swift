//
//  AddToCountButton.swift
//  Counter
//
//  Created by Ken Mueller on 10/22/19.
//  Copyright © 2019 Ken Mueller. All rights reserved.
//

import SwiftUI

struct AddToCountButton: View {
	@Binding var count: Int
	let amount: Int
	
    var body: some View {
		Button(action: {
			self.count += self.amount
		}) {
			Text("+\(amount)")
		}
    }
}

struct AddToCountButton_Previews: PreviewProvider {
    static var previews: some View {
		AddToCountButton(count: .constant(0), amount: 1)
    }
}
