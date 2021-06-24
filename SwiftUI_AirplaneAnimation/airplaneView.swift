//
//  ContentView.swift
//  SwiftUI_BicycleAnimation
//
//  Created by Seogun Kim on 2021/06/23.
//

import SwiftUI

//MARK: BODY
struct airplaneView: View {
    
    @State var moveToItem: Bool = false
    
    let SkyBackground: LinearGradient = LinearGradient(gradient: Gradient(colors: [.white, Color(hex: 0xfbc2eb), Color(hex: 0xa6c1ee)]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        GeometryReader { geo in
            
            VStack(alignment: moveToItem ? .trailing : .leading, spacing: 0) {
                
                Spacer()
                
                Airplane
                
                Spacer()
                Spacer()
                
                person
                .frame(maxWidth: .infinity)
                .font(.system(size: 70))
                
                //땅
                Image("ground")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height / 6)
                
            }
            .background(SkyBackground)
            .onAppear(perform: {
                moveToItem.toggle()
            })
            .ignoresSafeArea()
        }
    }
    
    //some Views
    private var Airplane: some View {
        Image(systemName: "airplane")
            .rotationEffect(Angle(degrees: moveToItem ? -30 : -10))
            .offset(
                x: moveToItem ? 100 : -130,
                y: moveToItem ? -200 : 200)
            .font(.system(size: 90))
        
            .animation(Animation.easeIn(duration: 3)
                        .delay(1.0)
                        .repeatForever(autoreverses: false))
            .foregroundColor(Color(hex: 0xff8882))
    }
    
    private var person: some View {
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
            .offset(x: moveToItem ? 100 : 0)
            .frame(maxWidth: .infinity, alignment: moveToItem ? .trailing : .leading)
        }
    }
}

//MARK: EXTENSION
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

//MARK: PREVIEWS
struct airplaneView_Previews: PreviewProvider {
    static var previews: some View {
        airplaneView()
    }
}
