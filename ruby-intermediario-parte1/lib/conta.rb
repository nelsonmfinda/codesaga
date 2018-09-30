# :nodoc:
class Conta
  attr_accessor :numero, :nome, :saldo, :limite, :titular

  def initialize(numero, nome, saldo, limite)
    @numero = numero
    @nome = nome
    @saldo = saldo
    @limite = limite
    @titular = Cliente.new(@nome)
  end

  def sacar(valor)
    if @saldo >= valor && valor > 0
      novo_valor = @saldo - valor
      @saldo = novo_valor
      true
    else
      novo = @saldo - valor
      @saldo = novo
      false
    end
  end

  def depositar(valor)
    novo_valor = @saldo + valor
    @saldo = novo_valor
  end

  def transfere(conta_destino, valor_transferencia)
    if sacar(valor_transferencia)
      conta_destino.depositar(valor_transferencia)
      true
    else
      false
    end
  end

  def no_limite?
    @saldo < 0
  end

  def ==(another_class)
    self.class === another_class
  end
end

# :nodoc:
class Cliente
  attr_accessor :titular

  def initialize(titular)
    @titular = titular
  end
end
