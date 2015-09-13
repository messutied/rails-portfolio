module Portfolio
  class SiteProject < SiteItem
    default_scope -> { self.of_type self.type_name }

    def self.display_name
      'Portfolio'
    end
  end
end
