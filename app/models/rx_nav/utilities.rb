module RxNav
  module Utilities

    def clean_xml(field, field_name)
      if field
        field.gsub(/field_name/,'').gsub(/\</,'').gsub(/\/\>/,'')
      else
        ''
      end
    end

  end
end