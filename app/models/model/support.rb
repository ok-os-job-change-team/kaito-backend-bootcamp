module Model
  module Support
    def present?
      !blank?
    end

    def blank?
      id == nil || id.size == 0
      # もしくは、以下でも可能。(以下の方が挙動が正しいかも。)
      # id.respond_to?(:empty?) ? id.empty? : !id
    end
  end
end
