object castillo {
  var nivelDefensa = 150
  method altura()=20

  method recibirAtaque(potencia){
    nivelDefensa = nivelDefensa-potencia
  }

  method valor()=nivelDefensa*0.20

  method recibirTrabajo(){
    nivelDefensa=nivelDefensa+20
    if (nivelDefensa>200){
      nivelDefensa=200
    }
  }

  method nivelDefensa()=nivelDefensa
}

object aurora {
  var estaViva=true
  method altura()=1
  method recibirAtaque(potencia){
    if (potencia >= 10){
      estaViva=false
    }
  }
  method valor()=15
  method recibirTrabajo(){}

  }



object tipa{
  var altura=8
  method recibirAtaque(){}
  method valor()=altura*2
  method recibirTrabajo(){
    altura=altura+1
  }

}

object ballesta{
  var cantFlechas = 10

  method usarArma(){
    cantFlechas = cantFlechas- 1
  }
  method estaCargada(){
    return cantFlechas>0
  }
  method potencia()=4
}

object  jabalina{
  var carga = 1
  method usarArma(){
    carga=0
  }
  method estaCargada(){
    return carga==1
  }
  method potencia()=30
}

object floki{
  var arma=ballesta
  method encontrar(elemento){
    if (arma.estaCargada()){
      elemento.recibirAtaque(arma.potencia())
      arma.usarArma()
    }
  }
}

object mario{
  var valorRecolectado=0
  var alturaElemento=0
  method encontrar(elemento){
    valorRecolectado= valorRecolectado + elemento.valor()
    elemento.recibirTrabajo()
    alturaElemento=elemento.altura()
  }

  method esFeliz(){
    return valorRecolectado>=50 || alturaElemento>=10
  }
}

object luisa{
  var personajeActivo=null
  method asignarJugador(unPersonaje){
    personajeActivo=unPersonaje
  }
  method apareceElemento(unElemento){
    if (personajeActivo != null)
    personajeActivo.encontrar(unElemento)
  }
}