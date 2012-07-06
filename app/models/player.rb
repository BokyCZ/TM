class Player < ActiveRecord::Base
  require "net/http"
  require "uri"

  attr_accessible :name, :team, :sex, :age

  has_one :qualification, :dependent => :destroy
  has_one :competition

  validate :validate_tm
  validates :name, :presence => true, :uniqueness => true
  validates :team, :presence => true, :uniqueness => true
  validates :sex,  :presence => true
  validates :age,  :presence => true, :numericality => {:only_integer => true, :greater_than => 5, :less_than => 100}

  scope :ordered_by_name, order("name")

  def validate_tm
    uri = URI.parse("http://www.tenismanazer.cz/zebricek.php")
    response = Net::HTTP.post_form(uri, {"hledat_nazevtymu" => team, "hledat_manazer" => name, "hledat_tym" => "submit"})
    if (response.code != "200")
      errors.add(" ", "Bohuzel server TM neodpovida, opakujte registraci pozdeji")
    else
      if (response.body.include? "Nebyl nalezen")
        if name != ""
          errors.add(:name , :error)
        end
        if team != ""
          errors.add(:team , :error)
        end
      end
    end
  end

  #Rails.logger.debug <promena, text, podminka atd> debugging

end
