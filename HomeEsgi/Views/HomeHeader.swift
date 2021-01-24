//
//  HomeHeader.swift
//  HomeEsgi
//
//  Created by Taj Singh on 23/01/2021.
//

import Foundation
import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text("welcome back !")
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                    .padding(.top, 5)
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}
