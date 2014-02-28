
//Client side validation  

//Validation for create a mobile device
jQuery(document).ready(function() {
	
  jQuery("#new_mobile_device").validate({
	errorElement:'div',
	rules: {
	  "mobile_device[imei]":{
	 				  required: true
				}	,
	    "mobile_device[manufacturer_name]" :{
	                    required: true
	    }
	
		},
	messages: {
	"mobile_device[imei]":{
					  required: "Name cannot be blank!"
					 
				}	,
	    "mobile_device[manufacturer_name]" :{
	                    
						required: "Manufacturer name cannot be blank!"
	    }
		}
	});

  //Validation for create a user
  jQuery("#user").validate({
	errorElement:'div',
	rules: {
	  "user[user_fullname]":{
	 				  required: true
				}	,
	    "user[username]" :{
	                    required: true
	    },

	    "user[email]" :{
	    	           required: true
	    },

	    "user[password_confirmation]" :{
	    	                   required :true
	    },

	    "user[password]" :{
	    	                   required :true
	    },

	    "user[mobile_no]" :{
	    	                   number :true,
						       minlength:10
	    },
        
        "user[role_ids]" :{
	    	                   required :true
	    }

	
		},
	messages: {
	"user[user_fullname]":{
					  required: "Full name cannot be blank!"
					 
				}	,
	    "user[username]" :{
	                    
						required: "User name cannot be blank!"
	    },

	    "user[email]" :{
	    	           required: "Email cannot be blank!"
	    },

	    "user[password_confirmation]" :{
	    	                   required: "Password confirmation cannot be blank!"
	    },

	    "user[password]" :{
	    	                   required : "Password cannot be blank!"
	    },

	    "user[mobile_no]" :{
	    	                   minlength:"do not enter less than 10 digit"
	    },

	    "user[role_ids]" :{
	    	                   required :"Please enter role!"
	    }
		}
	});
   
    //Validation for create a Zone
    jQuery("#zone").validate({
	errorElement:'div',
	rules: {
	  "admin_zone[zone_name]":{
	 				  required: true
				}	
	
		},
	messages: {
	"admin_zone[zone_name]":{
					  required: "Zone name cannot be blank!"
					 
				}	
		}
	});

    //Validation for create a block
	jQuery("#block").validate({
	errorElement:'div',
	rules: {
	    "admin_block[block_name]":{
	 				  required: true
				}	,
	    "admin_block[district_id]" :{
	                    required: true
	    }
	
		},
	messages: {
	    "admin_block[block_name]":{
					  required: "Block name cannot be blank!"
					 
				}	,

	    "admin_block[district_id]" :{
	    	           required: "District cannot be blank!"
	    }

		}
	});

	//Validation for create a district
	jQuery("#district").validate({
	errorElement:'div',
	rules: {
	    "admin_district[district_name]":{
	 				  required: true
				}	,
	    "admin_district[code]" :{
	                    required: true
	    },

	    "admin_district[zone_id]" :{
	    	           required: true
	    }
	
		},
	messages: {
	    "admin_district[district_name]":{
					  required: "District name cannot be blank!"
					 
				}	,
	    "admin_district[code]" :{
	                    
						required: "Code name cannot be blank!"
	    },

	    "admin_district[zone_id]" :{
	    	           required: "Zone cannot be blank!"
	    }

		}
	});

	//Validation for create a grampanchyat
	jQuery("#grampanchyat").validate({
	errorElement:'div',
	rules: {
	    "admin_grampanchyat[gram_name]":{
	 				  required: true
				}	,
	    "admin_grampanchyat[block_id]" :{
	                    required: true
	    }
	
		},
	messages: {
	    "admin_grampanchyat[gram_name]":{
					  required: "Grampanchyat name cannot be blank!"
					 
				}	,

	    "admin_grampanchyat[block_id]" :{
	    	           required: "Block cannot be blank!"
	    }

		}
	});

	//Validation for create a village
	jQuery("#village").validate({
	errorElement:'div',
	rules: {
	    "admin_village[village_name]":{
	 				  required: true
				}	,
	    "admin_village[grampanchyat_id]" :{
	                    required: true
	    }
	
		},
	messages: {
	    "admin_village[village_name]":{
					  required: "Village name cannot be blank!"
					 
				}	,

	    "admin_village[grampanchyat_id]" :{
	    	           required: "Grampanchyat cannot be blank!"
	    }

		}
	});

	//Validation for create a habitation
	jQuery("#habitation").validate({
	errorElement:'div',
	rules: {
	    "admin_habitation[habitation_name]":{
	 				  required: true
				}	,
	    "admin_habitation[village_id]" :{
	                    required: true
	    }
	
		},
	messages: {
	    "admin_habitation[habitation_name]":{
					  required: "Habitation name cannot be blank!"
					 
				}	,

	    "admin_habitation[village_id]" :{
	    	           required: "Village cannot be blank!"
	    }

		}
	});

	//Validation for create a source
    jQuery("#source").validate({
	errorElement:'div',
	rules: {
	  "admin_source[source_name]":{
	 				  required: true
				},

		"admin_source[code]":{
	 				  required: true
				}	
	
		},
	messages: {
	"admin_source[source_name]":{
					  required: "Water source name cannot be blank!"
					 
				},

	"admin_source[code]":{
	 				  required: "Code cannot be blank!"
				}				
		}
	});



});
	