//
//  CountDownView.swift
//  AdvancedNavigation
//
//  Created by Yaquelin Cisneros on 12/11/25.
//
import SwiftUI

struct CountdownDisplay: View {

    let number: Int
    let namespace: Namespace.ID

    @State private var scale: CGFloat = 2.0
    @State private var opacity: Double = 0.0

    var body: some View {
        ZStack {

            if number > 0 {
                Text("\(number)")
                    .font(.system(size: 150))
                    .bold()
                    .foregroundColor(.pink)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .transition(.opacity)
            }

            if number == 5 {
                Image(systemName: "person.fill")
                    .font(.system(size: 100))
                    .matchedGeometryEffect(id: "person", in: namespace)
                    .offset(y: -200)
                    .transition(.opacity)
            }

            if number == 4 {
                Image(systemName: "person.2.fill")
                    .font(.system(size: 100))
                    .matchedGeometryEffect(id: "person", in: namespace)
                //made my  person fill go to the left
                    .offset(x: -150)
                    .transition(.opacity)
            }

            if number == 3 {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 100))
                    .matchedGeometryEffect(id: "person", in: namespace)
                    .offset(x: 150)
                    .transition(.opacity)
            }

            if number == 2 {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 100))
                    .matchedGeometryEffect(id: "person", in: namespace)
                
                    .offset(y: 200)
                    .transition(.opacity)
            }

            if number == 0 {
                Text("GO!")
                    .font(.system(size: 150))
                    .bold()
                    .foregroundColor(.pink)
            }
        }
        .onChange(of: number) { _, newValue in
            if newValue > 0 {
                scale = 2.0
                opacity = 0.0
                withAnimation(.easeOut(duration: 0.6)) {
                    scale = 1.0
                    opacity = 1.0
                }
            }
        }
    }
}
//I use onChange to run the animation every time the countdown number changes.
    // my opactiy means how visible it is
//offset moves the view profile fill
