//
//  SplashScreen.swift
//  SplashAnimationsSwiftUI (iOS)
//
//  Created by Mac on 22/10/2021.
//

import SwiftUI

    

struct SplashScreen: View {
    //animated properties
    @State  var startanimation :Bool = false
    @State  var circleanimation1 :Bool = false
    @State  var circleanimation2 :Bool = false
    
    //end animated
    
    @Binding var endanimated :Bool
    
    var body: some View {
        ZStack{
            Color("SplashColor")
            Group{
                splashShap()
                //trimminng
                    .trim(from: 0, to: startanimation ? 1 : 0 )
                //stroke get outline
                    .stroke(Color.white,style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round ))
                
                // 2 circle
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleanimation1 ? 1:0)
                    .offset(x: -80, y: 22)
                
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleanimation2 ? 1:0)
                    .offset(x:  80, y: -22)
            }
            //default frame
            .frame(width: 220, height: 130)
            .scaleEffect(endanimated ? 0.15 : 0.9)
            .rotationEffect(.init(degrees: endanimated ? 85 : 0))
            
            
            //bottom line
            VStack
            {
                Text("Powered By ")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text("Sikandar Ali")
                    .font(.title2)
                    .fontWeight(.semibold)
            } .foregroundColor(Color.white.opacity(0.8))
              .padding(.bottom , getsafearea().bottom == 0 ? 15 : getsafearea().bottom)
              .frame(maxHeight:.infinity,alignment: .bottom)
              .opacity(startanimation ? 1: 0)
              .opacity(endanimated ? 0:1)
        
        }
        //moving toward  view....
         .offset(y: endanimated ? -(getReat().height * 1.5) : 0)
         .ignoresSafeArea()
         .onAppear {
                
                // start delay.......
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                    withAnimation(.spring().delay(0.15)){
                        // first circle
                        circleanimation1.toggle()
                    }
                    // S animation
                    
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 1.05, blendDuration: 1.05).delay(0.3)){
                        startanimation.toggle()
                    }
                    withAnimation(.spring().delay(0.7)){
                        // first circle
                        circleanimation2.toggle()
                    }
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(1.3)){
                        endanimated.toggle()
                    }
                }
            }
            
    }
   
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// extending view to get screen frame
extension View {
    
    func getReat() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getsafearea()->UIEdgeInsets{
   guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        guard let Safearea = screen.windows.first?.safeAreaInsets
        else{
            return .zero
        }
        return Safearea
    }
    
}



struct splashShap:Shape{
    func path(in rect: CGRect) -> Path {
        return Path{
            path in
            let mid = rect.width / 2
            let height =  rect.height
            
            // 80 = 40 arce radius
            
            path.move(to: CGPoint(x: mid - 80, y: height))
             // down curse of S
            path.addArc(center: CGPoint(x: mid - 40, y: height), radius: 40, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: true)
            
            //Straight line of S
                // actullly its look like j
            path.move(to: CGPoint(x: mid , y: height))
            path.addLine(to: CGPoint(x: mid, y: 0))
            
            // second arc of S
            
            path.addArc(center: CGPoint(x: mid + 40, y: 0 ), radius: 40, startAngle: .init(degrees: -180), endAngle: .zero, clockwise: false)
        }
    }
    
    
}
