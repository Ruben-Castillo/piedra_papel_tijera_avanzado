def menu(turno)
    puts "Turno del Jugador #{turno}. Elige una opción:"
    puts '1.Piedra'
    puts '2.Papel'
    puts '3.Tijeras'
    puts '4.Salir'
end
def pedir_jugada 
    opcion_jugador=gets.to_i
    return opcion_jugador
end
def opcion_valida?(jugada)
    jugada>=1 && jugada<=4
end 
def opcion_salir?(jugada)
    jugada==4
end
def cambia_turno(turno)
    1 if turno==2
    2 if turno==1
end
def selecciona_ganador(opcion_jugador1,opcion_jugador2)
    gana_jugador1=[-2,1]
    puts "Gana Jugador 1"  if gana_jugador1.include?(opcion_jugador1-opcion_jugador2)
    puts "Empate" if opcion_jugador1-opcion_jugador2==0
    puts "Gana Jugador 2"  if gana_jugador1.include?((opcion_jugador1-opcion_jugador2)*-1)
end
def abandono(turno)
    puts "El Jugador #{turno} ha abandonado el juego. Gana el Jugador 1" if turno==2
    puts "El Jugador #{turno} ha abandonado el juego. Gana el Jugador 2" if turno==1
end

#Programa
turno=1
v_jugadas=[0,0]
while v_jugadas[0]==0 || v_jugadas[1]==0
    menu(turno)
    jugada=pedir_jugada
    if opcion_valida?(jugada)
        if opcion_salir?(jugada)
            abandono(turno)
            v_jugadas=['end','game']
        else
            v_jugadas[turno-1]=jugada
            turno= cambia_turno(turno)
        end
    else
        puts '¡¡La opción ingresada no es válida!!'
    end
end
selecciona_ganador(v_jugadas[0],v_jugadas[1]) if v_jugadas!=['end','game']








