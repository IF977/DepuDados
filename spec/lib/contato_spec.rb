require 'rails_helper'
require 'Contato'

describe Contato do
	num_permitidos = /[0-9]/
	caracteres_permitidos = /[a-zA-Z0-9]/
	email_valido = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	contato_instance = Contato.new

	it 'is a instance of Contato?' do
		expect(contato_instance).to be_an_instance_of(Contato)
	end

	it 'has an valid name?' do
		expect(contato_instance.name).not_to be_empty
		expect(contato_instance.name).to match (caracteres_permitidos)
	end

	it 'has an valid user_email?' do
		expect(contato_instance.email).not_to be_empty
    expect(contato_instance.email).to match (email_valido)
	end

	it 'has an valid message?' do
	  expect(contato_instance.message).not_to be_empty
	end
end
