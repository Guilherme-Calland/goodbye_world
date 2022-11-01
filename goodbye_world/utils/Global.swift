//
//  Strings.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 01/11/22.
//

var global_language = Language.english

enum Language {
    case portuguese
    case english
}

let objective_text = [
    Language.portuguese : "Objetivo",
    Language.english: "Objective"
]

let objective_completed_text = [
    Language.portuguese : "Objetivo concluído",
    Language.english: "Objective Completed"
]

let pressAnywhere = [
    Language.portuguese : "PRESSIONE EM QUALQUER LUGAR PARA INICIAR",
    Language.english : "tap anywhere to start"
]

let tap_anywhere = [
    Language.english : "tap anywhere to continue",
    Language.portuguese : "Pressione em qualquer lugar para continuar"
]

let menu_title = [
    Language.portuguese : "menu de opções",
    Language.english : "options menu"
]

let menu_progress = [
    Language.portuguese : "progresso",
    Language.english: "progress"
]

let menu_story = [
    Language.portuguese : "história",
    Language.english : "story"
]

let menu_volume = [
    Language.portuguese : "volume",
    Language.english : "english"
]

let menu_saves = [
    Language.portuguese : "saves",
    Language.english : "saves"
]

let menu_back = [
    Language.portuguese : "voltar",
    Language.english : "back"
]

let story_title = [
    Language.portuguese : "história",
    Language.english : "story"
]

let story_text1 = [
    Language.portuguese : " Terra 2237, as I.As evoluíram muito, ao ponto que passaram a se tornar uma ameaça... Robôs e humanos iniciaram uma guerra, que teve os robôs como vencedores.",
    Language.english : " Earth 2237, the A.Is evolved a great deal, they started becoming a threat... a war erupted, a war won by the robots."
]

let story_text2 = [
    Language.portuguese : " As pessoas mais ricas conseguiram fugir da terra, rumo a e73, um planeta habitável, que os humanos pretendem colonizar.",
    Language.english : " The wealthy fled the planet, setting a course towards E73, a planet they planned on colonizing."
]

let story_text3 = [
    Language.portuguese : " Porém, os humanos mais pobres, que ficaram na terra, passaram a viver como refugiados ou como escravos dos robôs.",
    Language.english : " However, the poor, the ones that remained on Earth, lived on as slaves to the machines."
]

let story_text4 = [
    Language.portuguese : " Neste cenário, Juquinha tem que consertar a sua nave para sair da terra e salvar a sua família.",
    Language.english : " One of them, our hero little Jack must fix his ship to leave earth and save his family."
]

let story_text5 = [
    Language.portuguese : " Para ter chances contra os robôs e alcançar os seus objetivos, ele terá que passar a agir como um robô, o que colocará a sua humanidade em risco.",
    Language.english : " In order to stand a chance against the robots and achieve his goal, he must start acting like a robot, at the cost of him losing his own humanity."
]

let lvl1_tut_text1 = [
    Language.portuguese : "esse é você",
    Language.english : "this is you"
]

let lvl1_tut_text2 = [
    Language.portuguese : "Isso é a área de ações\n\naqui aparecerá todas as escolhas que você poderá fazer.",
    Language.english : "This is the action area\n\nhere will appear all the choses you can make."
]

let lvl1_tut_text3 = [
    Language.portuguese : "essa é a area de execucões.\n\nas acoes só poderão ser realizadas uma vez que estiverem nessa area",
    Language.english : " this is the execution area.\n\n actions can only be\n utilized once they are\n in this area"
]

let lvl1_tut_tap_action = [
    Language.portuguese : "  aperte na ação para levá-la \n  para " +
    "a area de execução." +
    "\n  uma vez que as ações\n  estiverem na area \n  de execução, aperte \n  no ícone para executar \n  as ações",
    Language.english : "tap on the action to take \n it to the execution area.\n once the actions\n are in the execution \n area, tap on the execution\n icon to execute\n your actions."
]

// LEVEL 1

let lvl1_objective = [
    Language.portuguese : "Pergunte se está tudo bem",
    Language.english : "Ask how he's doing"
]

let lvl1_text1 = [
    Language.portuguese : "Ok. agora vamos ver se você consegue concluir o objetivo a seguir.",
    Language.english : "Ok. now lets see if you can manage to complete this next objetive"
]

let lvl1_speach1 = [
    Language.portuguese : "tudo bem?",
    Language.english : "how are you?"
]

let lvl1_speach2 = [
    Language.portuguese : "tudo ótimo amigão!",
    Language.english : "I'm great buddy!"
]

let lvl2_option1 = [
    Language.portuguese : "odeio robôs",
    Language.english : "I hate robots"
]

let lvl2_option2 = [
    Language.portuguese : "que horas são?",
    Language.english : "what time is it?"
]

let lvl2_option3 = [
    Language.portuguese : "morte aos humanos,\nnão é mesmo?",
    Language.english : "destroy all humans?"
]

let lvl2_message1 = [
    Language.portuguese : "isso é a área de funções.\n\nem programacao, uma função é um pedaco de código que faz alguma tarefa específica.\n\no princípio de uma função está, naturalmente, em permitir encapsular uma ideia ou operacão, dando-lhe um nome, e então chamar essa operacão de várias partes do programa simplesmente usando seu nome",
    Language.english : "this is the function area.\n\nin programming, a function is a piece of code that performs a specefic task.\n\nthe ideia behind a function is, naturally, to allow us to encapsulate an operation, giving it a name, and so to allow us to call this operation from any part of the code simply using the function name"
]

let lvl2_message2 = [
    Language.portuguese : "Essa é uma função\n\nfunções muitas vezes recebem parâmetros. parâmetros são informacões que passamos para dentro das funções para controlarmos como ela será executada.\n\npara ver quais parâmetros a função pode receber, aperte na caixinha do lado direito da função.",
    Language.english : "this is a function\n\na lot of times functions recieve parameters. parameters are information that we pass into the function so we can control how it will get executed.\n\nto see what parameters the function can recieve, push the box on the right-hand side of the function."
]

let lvl2_objective = [
    Language.portuguese : "mantenha seu disfarce",
    Language.english : "don't blow your cover"
]

let lvl2_robot_speach = [
    Language.portuguese : "haha! com certeza.",
    Language.english : "haha! of course!"
]

let lvl3_text1 = [
    Language.portuguese : "vamos agora para a linguagem swift.\n\nprint, do inglês, imprimir, é uma função de swift que recebe como parâmetro um texto, e imprime o texto recebido na tela.",
    Language.english : "let's move on to the swift programming language.\n\nprint, is a function that recieves a text as a parameter and prints out the text on the screen."
]

let lvl3_objective = [
    Language.portuguese : "mande os robôs levarem o intruso",
    Language.english : "get rid of the intruder"
]

let lvl3_speach_bubble1 = [
    Language.portuguese : "amigo, pare! sou eu!!",
    Language.english : "buddy, stop! it's me!!"
]


