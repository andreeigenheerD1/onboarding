class Payload

    def payload_busca_produto(cpf, empresa)
        JSON.generate({
            :"cpfCnpj"=> "#{MASSA['numero_cpf_valido']}",
            :"empresa"=> MASSA['empresa']["#{empresa}"]
            }
        )
    end
end
