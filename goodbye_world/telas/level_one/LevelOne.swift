//
//  LevelOne.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 24/10/22.
//

import SwiftUI

struct LevelOne : View{
    @State var anim1Show = false
    @State var clickForNextShow = false
    @State var onScreenTapActive = true
    @State var imagePath = "tut1.1"
    @State var imageShow = false
    
    var body: some View{
        ZStack{
            LevelText1().opacity(anim1Show ? 1 : 0)
            ClickForNext().opacity(clickForNextShow ? 1 : 0)
    
            if(onScreenTapActive){
                TapOnScreen()
                    .onTapGesture{
                        hideAnim1()
                        hideClickForNext()
                        onScreenTapActive = false
                    }
            }
            
            HStack{
                //Imagem Principal
                Image(imagePath)
                    .resizable()
                    .interpolation(.none)
                    .opacity(imageShow ? 1 : 0)
            }
            
        }.onAppear(){
            showAnim1()
            showClickForNext()
        }
    }
    
    func showAnim1(){
        withAnimation(Animation.linear(duration: 1.0)){
            anim1Show = true
        }
    }
    
    func hideAnim1(){
        withAnimation(Animation.linear(duration: 1.0)){
            anim1Show = false
        }
    }
    
    func showClickForNext(){
        withAnimation(Animation.linear(duration: 1.0)){
            clickForNextShow = true
        }
    }
    
    func hideClickForNext(){
        withAnimation(Animation.linear(duration: 1.0)){
            clickForNextShow = false
        }
    }
}

