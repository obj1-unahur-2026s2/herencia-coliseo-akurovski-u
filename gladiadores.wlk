import equipo.*

class Gladiador
{
    var vida = 100
    const fuerza = 0
    const destreza = 0

    var arma = null
    var armadura = null

    method getVida() = vida

    method getFuerza() = fuerza

    method getDestreza() = destreza

    method getArma() = arma

    method getArmadura() = armadura

    method calcularAtaque()
    {
        var poderAtaque = self.getFuerza()

        if(arma != null)
        {
            poderAtaque = poderAtaque + arma.valorDaño()
        }

        return poderAtaque
    }

    method calcularDefensa()
    {
        var defensa = 0

        if(armadura != null)
        {
            defensa = defensa + armadura.valorDefensa()
        }

        defensa = defensa + self.getDestreza()

        return defensa
    }

    method calcularDaño(otro) = self.calcularAtaque() - otro.calcularDefensa()

    method setArma(a)
    {
        arma = a
    }

    method setArmadura(a)
    {
        armadura = a
    }

    method recibirDaño(d)
    {
        vida = vida - d
    }

    method atacar(otro)
    {
        otro.recibirDaño(self.calcularDaño(otro))
    }

    method defenderse(otro)
    {
        self.recibirDaño(otro.calcularDaño(self))
    }
}

/*Y los gladiadores atacan!!
Cuando un mirmillon ataca a cualquier gladiador le inflige al atacado tanto daño como la diferencia entre su poder de ataque y la defensa del atacado. El poder de ataque equivale al poder de su arma más su propia fuerza. Cuando un dimachaerus ataca a otro gladiador, también le inflige al atacado tanto daño como la diferencia entre su poder de ataque y la defensa del atacado, pero su poder de ataque equivale a su fuerza más la sumatoria de los poderes de todas las armas que tenga. Además, cada vez que ataca, aumenta en 1 su destreza. Para un mirmillon, su defensa se calcula como los puntos de su armadura más su destreza. Para un dimachaerus, su defensa es la mitad de su destreza.

Se pide implementar la solución que considere necesaria para hacer que un gladiador ataque a otro.*/

class Mirmillon inherits Gladiador
{
    override method getDestreza() = 15

    override method setArmadura(a)
    {
        armadura = a
    }
}

class Dimachaerus inherits Gladiador
{
    override method getFuerza() = 10

    override method atacar(otro)
    {
        otro.recibirDaño(self.calcularDaño(otro))
    }

    override method setArmadura(a)
    {
        armadura = null
    }

    override method setArma(a)
    {
        if(arma == null)
        {
            arma = []
        }

        arma.append(a)
    }

    override method calcularAtaque()
    {
        var poderAtaque = self.getFuerza()

        if(arma != null)
        {
                poderAtaque = poderAtaque + self.getArma().sum(arma.valorDaño())
        }

        return poderAtaque
    }

    override method calcularDefensa()
    {
        return self.getDestreza() * 0.5
    }


}