//
//  Function.swift
//  goodbye_world
//
//  Created by Arthur Abrahão on 20/10/22.
//

import SwiftUI

let orange1 = Color( #colorLiteral(red: 1, green: 0.5231882333755493, blue: 0.17259114980697632, alpha: 1))
let orange2 = Color( #colorLiteral(red: 1, green: 0.6000000238418579, blue: 0.30588236451148987, alpha: 1))
let orange3 = Color( #colorLiteral(red: 1, green: 0.3798591729, blue: 0.118114517, alpha: 1))


struct Function: View {
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    var parameters = ["Hello World", "Goodbye World", "Olá Mundo"]
    @State private var selectedParameter = " ? "
    @State var dropdown = false;
    @State var readyToExecute : Bool;

    
    @State var actionText: String?
    var onClickEvent: (Opcao) -> ();
    var action_data: OpcaoParametros;
    
    init(readyToExecute: Bool = false, actionText: String? = nil, action_data: OpcaoParametros, onClickEvent:@escaping (Opcao) -> ()){
        self.action_data = action_data;
        self.actionText = self.action_data.parametroSelecionado;
        self.readyToExecute = readyToExecute
        self.parameters = self.action_data.parametros;
        self.onClickEvent = onClickEvent;
    }

    var body : some View {
        ZStack{
            VStack(spacing:0){
                ZStack{
                    ActionShadow()
                    Rectangle()
                        .fill(Color(self.readyToExecute ?  "customGreen" : "customOrange"))
                        .border(.black, width: 4)
                        .onTapGesture {
                            if (selectedParameter != " ? " && dropdown == false){
                                self.onClickEvent(self.action_data);
                                SoundManager.Instance.playSfx("click")
//                                self.readyToExecute.toggle();
//                                dropdown = false
                            }else{
                                dropdown.toggle();
                            }
                        }
                    
                    HStack(spacing:0){
                        HStack{
                            Spacer()
                            Textinho.FonteBonita(self.action_data.nome)
                            Textinho.FonteBonita("(\(selectedParameter))")
                            Spacer()
                        }


                            ZStack{
                                if(!readyToExecute){
                                    Rectangle()
                                        .fill(orange3)
                                        .border(.black, width: 4)
                                        HStack{
                                            if(dropdown){
                                                Textinho.FonteBonita(" ▲ ")
                                            }
                                            else{
                                                Textinho.FonteBonita(" ▼ ")
                                            }
                                    }
                                }
                            }.frame(width: actionWidth*0.15, height: actionHeight, alignment: .center)
                            .onTapGesture {
                                dropdown.toggle()
                            }
              
                    }.frame(width: actionWidth+30, height: actionHeight, alignment: .leading)

                }.frame(width: actionWidth+30, height: actionHeight, alignment: .center)
                
                if(dropdown){
                    ForEach(parameters, id: \.self){
                        parameter in
                        ZStack{
                            Rectangle()
                                .fill(orange3)
                                .frame(width: actionWidth + 30, height: actionHeight * 2, alignment: .leading)
                                .border(.black, width: 2)
                            HStack{
                                Textinho.FonteBonita("\(parameter)")
                            }
                        }.onTapGesture{
                            self.action_data.parametroSelecionado =  parameter;
                            selectedParameter = parameter;
                            dropdown.toggle()
                        }
                    }
                }
                            
            }
        }

    }
}

//struct Function_Previews: PreviewProvider {
 //   static var previews: some View {
   //     Function().previewInterfaceOrientation(.landscapeLeft)
 //   }
//}
