module Model
  module Support
    def present?
      id != nil
    end

    def blank?
      !present?
    end
  end
end

# class User
#   include Model::Support
# end
