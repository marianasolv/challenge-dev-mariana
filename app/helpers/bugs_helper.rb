module BugsHelper

	# Display the value of attribute solve 
	def bool_to_str(value)
		if value == true
			"Yes"
		elsif value == false
			"No"
		elsif value == nil
			"Nil"
		end
	end

end
