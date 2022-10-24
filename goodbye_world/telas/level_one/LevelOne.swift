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
                        hide("anim1")
                        hide("clickForNext")
                        onScreenTapActive = false
                        wait(time: 1, doAfter: {
                            show("image")
                        })
                        
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
            show("anim1")
            show("clickForNext")
        }
    }
    
    func show(_ objName: String){
        withAnimation(Animation.linear(duration: 1.0)){
            if(objName == "image"){
                imageShow = true
            }else if(objName == "anim1"){
                anim1Show = true
            }else if(objName == "clickForNext"){
                clickForNextShow = true
            }
        }
    }
    
    func hide(_ objName: String){
        withAnimation(Animation.linear(duration: 1.0)){
            if(objName == "image"){
                imageShow = false
            }else if(objName == "anim1"){
                anim1Show = false
            }else if(objName == "clickForNext"){
                clickForNextShow = false
            }
        }
    }
    
    func wait(time: Double, doAfter: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            doAfter()
        }
    }
    
    
}

