# encoding: utf-8
module Utilidades

def self.geraCPF
  cpf = Cpf.new.generate
  return cpf
end

def self.geraCNPJ
  cnpj = Cnpj.new.generate
  return cnpj
end


  class Cpf
		NUMBERS = [*0..9].freeze

		def generate
		  numbers = 9.times.map { NUMBERS.sample }
		  numbers << Cpf.new.verifierDigit(numbers)
		  numbers << Cpf.new.verifierDigit(numbers)
		  numbers.join("")
		end

		def verifierDigit(numbers)
		  modulus = numbers.size + 1
		  multiplied = numbers.map.each_with_index do |number, index|
			number * (modulus - index)
		  end
		  mod = multiplied.reduce(:+) % 11
		  mod < 2 ? 0 : 11 - mod
		end

		def validateCpf(cpf=nil)

			return false if cpf.nil?

			winvalidos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000}
			wvalor = cpf.scan /[0-9]/

			if wvalor.length == 11
				unless winvalidos.member?(wvalor.join)
					wvalor = wvalor.collect{|x| x.to_i}
					wsoma = 10*wvalor[0]+9*wvalor[1]+8*wvalor[2]+7*wvalor[3]+6*wvalor[4]+5*wvalor[5]+4*wvalor[6]+3*wvalor[7]+2*wvalor[8]
					wsoma = wsoma - (11 * (wsoma/11))
					wresult1 = (wsoma == 0 or wsoma == 1) ? 0 : 11 - wsoma

					if wresult1 == wvalor[9]
						wsoma = wvalor[0]*11+wvalor[1]*10+wvalor[2]*9+wvalor[3]*8+wvalor[4]*7+wvalor[5]*6+wvalor[6]*5+wvalor[7]*4+wvalor[8]*3+wvalor[9]*2
						wsoma = wsoma - (11 * (wsoma/11))
						wresult2 = (wsoma == 0 or wsoma == 1) ? 0 : 11 - wsoma
						return true if wresult2 == wvalor[10]
					end
				end
			end

			return false
		end

	end

  class Cnpj
    def generate
      basenum = []
      12.times { basenum << rand(10) }
      pesos = [5,4,3,2,9,8,7,6,5,4,3,2]

      n = (0...basenum.length).inject(0) { |a, b| a + basenum[b] * pesos[b] }
      dv1 = if n%11 < 2; 0;
            else; 11-(n%11); end
      basenum << dv1

      pesos.unshift(6)

      n2 = (0...basenum.length).inject(0) { |a, b| a + basenum[b] * pesos[b] }
      dv2 = if n2%11 < 2; 0;
           else; 11-(n2%11); end
      cnpj = basenum << dv2

      return cnpj.map(&:to_s).join("")
    end

  end



end

#puts Utilidades.geraCPF
#puts Utilidades.geraCNPJ
