//
//  Card.swift
//  HomeEsgi
//
//  Created by Taj Singh on 04/01/2021.
//

import Foundation
import SwiftUI

struct Card: View {
    
    var name: String
    var image: String
    var value: String = ""
    var newValue: String = ""
    var color: Color
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: image)
                    .font(.system(size: 50))
                    .foregroundColor(color)
                Text(name)
                    .font(.system(size: 19, weight: .semibold, design: .default))
                    .offset(y: 20)
                    .foregroundColor(.black)
            }
            Text(value)
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.black)
            Text(newValue)
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.black)
        }
        .frame(width: width, height: height)
        .background(Color(#colorLiteral(red: 0.9591706395, green: 0.9661263824, blue: 0.9795565009, alpha: 1)))
        .cornerRadius(20)
        .shadow(color: .red, radius: 5)
        .border(Color.clear, width: 2)
        .padding(.bottom, 10)
    }
}
