module PersonnelsHelper
    def self.change_state(id)
		personnel = Personnel.find(id)
	    if personnel.is_enabled? 
	    	personnel.update(is_enabled: false)
	    	msg = "Personnel was successfully deactivated"
	    else
	    	personnel.update(is_enabled: true)
	    	msg = "Personnel was successfully activated"
	    end
	end
end
