//
//  PowerView.swift
//  HomeEsgi
//
//  Created by Taj Singh on 31/12/2020.
//

import Foundation
import SwiftUI

struct PowerView: View {
    var body: some View {
        HStack {
            Image(systemName: "power")
                .foregroundColor(.red)
                .font(.system(size: 24, weight: .black))
        }
    }
}
