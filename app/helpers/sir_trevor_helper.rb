module SirTrevorHelper
  def parse_sir_trevor(json)
    unless json.blank?
      hash = JSON.parse(json)

      return false unless hash.has_key?("data")
      hash["data"]
    end
  end

end
