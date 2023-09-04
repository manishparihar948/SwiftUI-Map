//
//  LocationMapAnnotationView.swift
//  SwiftMapApp
//
//  Created by Manish Parihar on 04.09.23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let mapPinColor = Color("MapPinColor")
    
    var body: some View {
        VStack(spacing:0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(mapPinColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(mapPinColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
        //.background(Color.yellow)
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
