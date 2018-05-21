class Contato < ApplicationRecord
    before_save :downcase_email
    validates :mensagem, presence: true
    validates :telefone, presence: true, format: { with: /\A[1-9]{2}9[6-9]{1}[0-9]{7}\z/, message: "O formato dos números ou o DDD está incorreto"}
    validates :nome, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}

    private

    # Converte email para lower-case.
    def downcase_email
      self.email = email.downcase
    end
end
