require 'rails_helper'

RSpec.describe "contatos/edit", type: :view do
  before(:each) do
    @contato = assign(:contato, Contato.create!(
      :nome => "MyString",
      :email => "MyString",
      :telefone => "MyString",
      :mensagem => "MyText"
    ))
  end

  it "renders the edit contato form" do
    render

    assert_select "form[action=?][method=?]", contato_path(@contato), "post" do

      assert_select "input[name=?]", "contato[nome]"

      assert_select "input[name=?]", "contato[email]"

      assert_select "input[name=?]", "contato[telefone]"

      assert_select "textarea[name=?]", "contato[mensagem]"
    end
  end
end
