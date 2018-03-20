module BugsHelper

	# Display the value of attribute solve 
	def bool_to_glyph(value)
		if value == true
			"True"
		elsif value == false
			"False"
		elsif value == nil
			"Nil"
		end
	end

end
