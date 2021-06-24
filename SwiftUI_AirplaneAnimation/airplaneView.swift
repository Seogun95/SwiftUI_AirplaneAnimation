//
//  ContentView.swift
//  SwiftUI_BicycleAnimation
//
//  Created by Seogun Kim on 2021/06/23.
//

import SwiftUI

struct airplaneView: View {
    
    @State var moveToRight: Bool = false
    
    let skyGradient: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0xfbc2eb), Color(hex: 0xa6c1ee)]), startPoint: .bottom, endPoint: .top)
    
    let gardenGradiemt: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0xc1dfc4), Color(hex: 0xe2d1c3)]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: moveToRight ? .trailing : .leading, spacing: 0) {
                Spacer()
                Image(systemName: "airplane")
                
                    .rotationEffect(Angle(degrees: moveToRight ? -30 : -10))
                    .offset(
                        x: moveToRight ? 100 : -130,
                        y: moveToRight ? -200 : 200)
                    .font(.system(size: 90))
                
                    .animation(Animation.easeIn(duration: 3)
                                .delay(1.0)
                                .repeatForever(autoreverses: false))
                
                    .foregroundColor(Color(hex: 0xff8882))
                Spacer()
                Spacer()
                
                
                
                HStack(alignment: .bottom) {
                    
                    Image(systemName: "figure.wave")
                        .padding(.leading, 10)
                    
                    
                    Image(systemName: "figure.wave")
                        .font(.system(size: 40))
                    
                    VStack {
                        
                        Image(systemName: "figure.walk")
                            .animation(Animation.easeIn(duration: 5)
                                        .repeatForever(autoreverses: false))
                    }
                    .offset(x: moveToRight ? 100 : 0)
                    .frame(maxWidth: .infinity, alignment: moveToRight ? .trailing : .leading)
                    
                }
                
                .frame(maxWidth: .infinity)
                .font(.system(size: 70))
                .foregroundColor(Color(hex: 0x303030))
                
                
                Rectangle()
                    .fill(gardenGradiemt)
                    .frame(width: geo.size.width, height: geo.size.height / 5)
            }
            
            .background(skyGradient)
            .onAppear(perform: {
                moveToRight.toggle()
            })
            .ignoresSafeArea()
        }
    }
}

// color Extension
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct airplaneView_Previews: PreviewProvider {
    static var previews: some View {
        airplaneView()
    }
}
