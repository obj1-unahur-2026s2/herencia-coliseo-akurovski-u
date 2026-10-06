class Arma
{
    const nombre = ""

    method valorDaño(){}

    method verNombre() = nombre
}

class ArmaFilo inherits Arma
{
    const filo = 1
    const longitud = 1

    override method valorDaño() = filo * longitud

    method verFilo() = filo

    method verLongitud() = longitud
}

class ArmaContundente inherits Arma
{
    const peso = 1

    method atacar() = peso

    method verPeso() = peso
}

class Armadura
{
    const nombre = ""
    const defensa = 1

    method valorDefensa() = defensa

    method verNombre() = nombre
}

class Casco inherits Armadura
{

    override method valorDefensa() = defensa
}

class Escudo inherits Armadura
{
    var destreza = 1

    method setDestreza(d)
    {
        destreza = d
    }

    override method valorDefensa() = defensa + (destreza * 0.1)
}

