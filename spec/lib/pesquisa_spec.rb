require 'rails_helper'
require 'Pesquisa'

describe Pesquisa do
	caracteres_permitidos = /[a-zA-Z]/

	pesquisa_instance = Pesquisa.new

	it 'is a instance of Contato?' do
		expect(pesquisa_instance).to be_an_instance_of(Pesquisa)
    expect(pesquisa_instance.name).not_to be_empty
	end
end
