//
//  FeedbackResponseView.swift
//  Jokes_unit5
//
//  Created by Moez Rehman on 7/13/23.
//

import SwiftUI

struct FeedbackResponseView: View {
    
    var isPositive = false
    
    var body: some View {
        
        VStack {
            Image(isPositive ? "happy" : "sad")
                .resizable()
                .scaledToFit()
            
            Text(isPositive ? "Thanks..." : "How could you do that...")
        }
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView()
    }
}
