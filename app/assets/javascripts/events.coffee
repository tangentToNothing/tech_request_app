# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
		toggle_event = (event) ->
			pane = "#" + event + "_pane"
			hidden = "#" + event + "_hidden"
			open = "#" + event + "_open"
			if $(hidden).is(':visible')
				$(open).fadeIn("fast")
				$(hidden).hide()
			else
				$(hidden).show()
				$(open).hide()

		set_event = (event) ->
			btn = "#" + event + "_button"
			$(btn).change ->
				toggle_event(event)

		ids = window.events
		set_event event for event in ids

		bureaus = $('#event_location_id').html()
		$('#room_type').change ->
			agency = $('#room_type :selected').text()
			options = $(bureaus).filter("optgroup[label='#{agency}']").html()
			if options && !(agency is "")
				$('#event_location_id').html(options)
				$('#room_next').prop('disabled', false)
			if agency is ""
				$('#event_location_id').html(bureaus)
				$('#room_next').prop('disabled', true)
			if agency is "Description: Bring Your Own Device room"
				$('#room_type_info').html("<p>The event location you have selected is equipped for presentation display only (e.g. a projector or wall-mounted display panel).</p><p>It is not equipped with a lectern PC, so you will need to bring your own laptop, tablet, or mobile device if you intend to present electronic materials. Please note you may need a display adapter to connect your device to the room audio visual system.</p><p>Your event location does not have microphones and cannot be equipped with them. If you need microphones for your event, you should contact the Academic Scheduling Office and request a different room.</p><p>Some rooms of this type offer the Wireless Presentation feature. For more information and a list of classrooms equipped for Wireless Presentation, please see the following page: <a href=\"https://acadtech.gwu.edu/wireless-presentation\">https://acadtech.gwu.edu/wireless-presentation</a>.</p>")
			if agency is "Description: PC-equipped room"
				$('#room_type_info').html("<p>The event location you have selected is equipped with a lectern PC and projector (or wall-mounted display panel) for display of presentation materials. Additionally, you can also bring your own laptop, tablet, or mobile device to present. Please note you may need a display adapter to connect your device to the room audiovisual system.</p><p>Your event location does not have microphones and cannot be equipped with them. If you need microphones for your event, you should contact the Academic Scheduling Office and request a different room.</p><p>Some rooms of this type offer the Wireless Presentation feature. For more information and a list of classrooms equipped for Wireless Presentation, please see the following page: <a href=\"https://acadtech.gwu.edu/wireless-presentation\">https://acadtech.gwu.edu/wireless-presentation</a></p><p>For a complete listing of technology available, please visit our Classrooms & Labs page and select your event location: <a href=\"https://acadtech.gwu.edu/classrooms-labs\">https://acadtech.gwu.edu/classrooms-labs</a></p>")
			if agency is "Description: PC-equipped room with limited microphones"
				$('#room_type_info').html("<p>The event location you have selected is equipped with a lectern PC and projector (or wall-mounted display panel) for display of presentation materials. Additionally, you can also bring your own laptop, tablet, or mobile device to present. Please note you may need a display adapter to connect your device to the room audiovisual system.</p><p>Your event location is equipped with a limited number of microphones (one standing podium microphone and one wireless lavalier \"clip-on\" microphone). Academic Technologies cannot add any additional microphones. If you need more microphones for your event, you should contact the Academic Scheduling Office and request a different room.</p><p>For a complete listing of technology available, please visit our Classrooms & Labs page and select your event location: <a href=\"https://acadtech.gwu.edu/classrooms-labs\">https://acadtech.gwu.edu/classrooms-labs</a></p>")
			if agency is "Description: PC-equipped room with microphone options"
				$('#room_type_info').html("<p>The event location you have selected is equipped with a lectern PC for display of presentation materials. Additionally, you can also bring your own laptop, tablet, or mobile device to present. Please note you may need a video adapter to connect your device to the classroom audiovisual system.</p><p>Your event location is equipped to support multiple wired and wireless microphones. The available options are listed below. Please be aware that setup of additional microphones is subject to approval by Academic Technologies</p><p>For a complete listing of technology available, please visit our Classrooms & Labs page and select your event location: <a href=\"https://acadtech.gwu.edu/classrooms-labs\">https://acadtech.gwu.edu/classrooms-labs</a></p>")
		
		$('#event_payment_method').change ->
			choice = $('#event_payment_method :selected').text()
			if choice is "EAS Account"
				$('#payment_method_check').prop("disabled", false)
				eas = "<label id=\"my_eas_label\" for=\"eas_account\">EAS Account Number </label><input name=\"event[eas_account]\" id=\"event_eas_account\" type=\"text\" class=\"form-control\">"
				$('#payment').append(eas)			
			else if choice != ""
				$('#payment_method_check').prop("disabled", false)
				$('#my_eas_label').remove()
				$('#event_eas_account').remove()
			else
				$('#payment_method_check').prop("disabled", true)
				$('#my_eas_label').remove()
				$('#event_eas_account').remove()

		types = $('#room_type').html()
		$('#event_location_id').change ->
			$('#room_next').prop('disabled', false)
			choice = $('#event_location_id :selected').text()
			$.ajax("/locations/get_room_type_id?name=#{choice}").success (result) ->
				agency = result.name
				if agency is "Description: Bring Your Own Device room"
					$('#room_type_info').html("<p>The event location you have selected is equipped for presentation display only (e.g. a projector or wall-mounted display panel).</p><p>It is not equipped with a lectern PC, so you will need to bring your own laptop, tablet, or mobile device if you intend to present electronic materials. Please note you may need a display adapter to connect your device to the room audio visual system.</p><p>Your event location does not have microphones and cannot be equipped with them. If you need microphones for your event, you should contact the Academic Scheduling Office and request a different room.</p><p>Some rooms of this type offer the Wireless Presentation feature. For more information and a list of classrooms equipped for Wireless Presentation, please see the following page: <a href=\"https://acadtech.gwu.edu/wireless-presentation\">https://acadtech.gwu.edu/wireless-presentation</a>.</p>")
				if agency is "Description: PC-equipped room"
					$('#room_type_info').html("<p>The event location you have selected is equipped with a lectern PC and projector (or wall-mounted display panel) for display of presentation materials. Additionally, you can also bring your own laptop, tablet, or mobile device to present. Please note you may need a display adapter to connect your device to the room audiovisual system.</p><p>Your event location does not have microphones and cannot be equipped with them. If you need microphones for your event, you should contact the Academic Scheduling Office and request a different room.</p><p>Some rooms of this type offer the Wireless Presentation feature. For more information and a list of classrooms equipped for Wireless Presentation, please see the following page: <a href=\"https://acadtech.gwu.edu/wireless-presentation\">https://acadtech.gwu.edu/wireless-presentation</a></p><p>For a complete listing of technology available, please visit our Classrooms & Labs page and select your event location: <a href=\"https://acadtech.gwu.edu/classrooms-labs\">https://acadtech.gwu.edu/classrooms-labs</a></p>")
				if agency is "Description: PC-equipped room with limited microphones"
					$('#room_type_info').html("<p>The event location you have selected is equipped with a lectern PC and projector (or wall-mounted display panel) for display of presentation materials. Additionally, you can also bring your own laptop, tablet, or mobile device to present. Please note you may need a display adapter to connect your device to the room audiovisual system.</p><p>Your event location is equipped with a limited number of microphones (one standing podium microphone and one wireless lavalier \"clip-on\" microphone). Academic Technologies cannot add any additional microphones. If you need more microphones for your event, you should contact the Academic Scheduling Office and request a different room.</p><p>For a complete listing of technology available, please visit our Classrooms & Labs page and select your event location: <a href=\"https://acadtech.gwu.edu/classrooms-labs\">https://acadtech.gwu.edu/classrooms-labs</a></p>")
				if agency is "Description: PC-equipped room with microphone options"
					$('#room_type_info').html("<p>The event location you have selected is equipped with a lectern PC for display of presentation materials. Additionally, you can also bring your own laptop, tablet, or mobile device to present. Please note you may need a video adapter to connect your device to the classroom audiovisual system.</p><p>Your event location is equipped to support multiple wired and wireless microphones. The available options are listed below. Please be aware that setup of additional microphones is subject to approval by Academic Technologies</p><p>For a complete listing of technology available, please visit our Classrooms & Labs page and select your event location: <a href=\"https://acadtech.gwu.edu/classrooms-labs\">https://acadtech.gwu.edu/classrooms-labs</a></p>")	

		$('#agree_type').change ->
			$('#type_next').prop('disabled', false)
			$('#agree_type').prop('disabled', true)
			choice = $('#event_location_id :selected').text()
			$.ajax("/locations/get_room_type_id?name=#{choice}").success (result) ->
				agency = result.name
				if agency is "Description: PC-equipped room with microphone options"
					wireless_handheld = "<label for=\"event_wireless_handheld\">Additional Wireless Handheld Microphones?</label><input name=\"event[wireless_handheld]\" id=\"event_wireless_handheld\" type=\"number\" class=\"form-control\"><br>"
					wireless_lav = "<label for=\"event_wireless_lav\">Additional Wireless Lavalier Microphones?</label><input name=\"event[wireless_lav]\" id=\"event_wireless_lav\" type=\"number\" class=\"form-control\"><br>"
					wired_handheld = "<label for=\"event_wired_handheld\">Additional Wired Handheld Microphones?</label><input name=\"event[wired_handheld]\" id=\"event_wired_handheld\" type=\"number\" class=\"form-control\"><br>"
					table_stands = "<label for=\"event_table_stands\">Additional Tabletop Microphone Stands?</label><input name=\"event[table_stands]\" id=\"event_table_stands\" type=\"number\" class=\"form-control\"><br>"
					floor_stands = "<label for=\"event_floor_stands\">Additional Floor Microphone Stands?</label><input name=\"event[floor_stands]\" id=\"event_floor_stands\" type=\"number\" class=\"form-control\"><br>"
					web_conferencing = "<label for=\"event_web_conferencing\">Web Conferencing?</label><label>Yes</label><input name=\"event[web_conferencing]\" id=\"event_web_conferencing\" type=\"radio\" value=\"1\"><label>No</label><input name=\"event[web_conferencing]\" id=\"event_web_conferencing\" type=\"radio\" value=\"0\"><br>"
					press_feed = "<label for=\"event_press_feed\">Press Feed?</label><label>Yes</label><input name=\"event[press_feed]\" id=\"event_press_feed\" type=\"radio\" value=\"1\"><label>No</label><input name=\"event[press_feed]\" id=\"event_press_feed\" type=\"radio\" value=\"0\"><br>"
					third_party_check = "<div id=\"third_party\"><label for=\"event_third_party\">Are You Using a Third Party AV Company?</label><input name=\"event[third_party]\" id=\"event_third_party\" type=\"checkbox\" class=\"form-control\"><br></div>"
					html_together = wireless_handheld + wireless_lav + wired_handheld + table_stands + floor_stands + web_conferencing + press_feed + third_party_check
					$('#part4').prepend(html_together)
					$('#event_third_party').change ->
						$('#event_third_party').prop('disabled', true)
						third_party_enter_info = "<label for=\"event_third_party_name\">Name of Third Party Company: </label><input name=\"event[third_party_name]\" id=\"event_third_party_name\" type=\"text\" class=\"form-control\"><br>"
						$('#third_party').append(third_party_enter_info)
		
		$('#event_additional_laptops').change ->
			$('#event_additional_laptops').prop('disabled', true)
			add_text = "<label for=\"event_additional_laptops_count\">How Many Additional Laptops?</label><input name=\"event[additional_laptops_count]\" id=\"event_additional_laptops_count\" type=\"number\" class=\"form-control\"><br>"
			$('#laptops').append(add_text)

		remove_tr = (element) ->
			modified = "#event_" + element 
			table_loc = "#" + element + "_table"
			attribute = "#" + element + "_attr"
			row = "#" + element + "_row"
			$(table_loc).remove()
			$(attribute).remove()
			$(row).remove()

		get_text = (element) -> 
			choice = $('#event_location_id :selected').text()
			current = []
			$.ajax("/locations/get_room_type_id?name=#{choice}", async: false).success (result) ->
				$('#desc_storage').val(result.name)
			current = $('#desc_storage').prop("value")
			if element is "multi_day"
				
			else if (element is "wireless_handheld") and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if (element is "wireless_lav") and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if (element is "wired_handheld") and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if (element is "table_stands") and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if element is "floor_stands" and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if element is "web_conferencing" and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if element is "press_feed" and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if element is "third_party" and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if element is "third_party"
				table_loc = "#" + element + "_table"
				modified = "#event_" + element 
				if $(modified).is(':checked')
					$(table_loc).html("<b>Yes</b>")
				else
					$(table_loc).html("<b>No</b>")
					remove_tr(element)
			else if element is "third_party_name" and (current != "Description: PC-equipped room with microphone options")
				remove_tr(element)
			else if element is "additional_laptops"
				table_loc = "#" + element + "_table"
				modified = "#event_" + element 
				if $(modified).is(':checked')
					$(table_loc).html("<b>Yes</b>")
				else
					$(table_loc).html("<b>No</b>")
			else if element is "additional_laptops_count"
				table_loc = "#" + element + "_table"
				modified = "#event_" + element 
				if $('#event_additional_laptops').is(':checked')
					$(table_loc).html("<b>" + $(modified).val() + "</b>")
				else
					remove_tr(element)
			else if element is "location_id"
				table_loc = "#" + element + "_table"
				$(table_loc).html("<b>" + choice + "</b>")
			else if element is "eas_account"
				remove_tr(element) if $('#event_payment_method :selected').text() != "EAS Account"
			else
				table_loc = "#" + element + "_table"
				modified = "#event_" + element 
				$(table_loc).html("<b>" + $(modified).val() + "</b>")

		parseTime = (s) ->
			c = s.split(":")
			return parseInt(c[0]) * 60 + parseInt(c[1])

		calculate_all_in_one_cost = ->
			half_day_rate = 100
			full_day_rate = 200
			if ($('#event_start_time').val() != "") and ($('#event_end_time').val() != "") and (parseTime($('#event_end_time').val()) > parseTime($('#event_start_time').val()))
				diff = (parseTime($('#event_end_time').val()) - parseTime($('#event_start_time').val()))
				if diff > 300
					$('#all_in_one_cost').html("<b>$" + full_day_rate + "</b>")
				else
					$('#all_in_one_cost').html("<b>$" + half_day_rate + "</b>")
			else
				alert("Invalid start and end times")
				$('#all_in_one').addClass('table-danger')
				$('#all_in_one_cost').html("Error")

		sum_and_input_add_on_costs = (result) ->
			wireless_handheld = 25
			wired_handheld = 25
			wireless_lav = 25
			press_feed = 30
			laptop = 100
			if result == "Description: PC-equipped room with microphone options"
				add_on_total_cost = 0
				wireless_handheld_count = $('#event_wireless_handheld').val()
				wireless_lav_count = $('#event_wireless_lav').val()
				wired_handheld_count = $('#event_wired_handheld').val()
				laptop_count = $('#event_additional_laptops_count').val()
				if parseInt(wireless_handheld_count) > 0
					add_on_total_cost += wireless_handheld_count * wireless_handheld
				if parseInt(wireless_lav_count) > 0
					add_on_total_cost += wireless_lav_count * wireless_lav
				if parseInt(wired_handheld_count) > 0
					add_on_total_cost += wired_handheld_count * wired_handheld
				if parseInt(laptop_count) > 0
					add_on_total_cost += laptop_count * laptop
				if $('#event_press_feed').is(':checked')
					add_on_total_cost += press_feed
				$('#add_on_equipment_cost').html("<b>$" + add_on_total_cost + "</b>")
			else
				laptop_count = $('#event_additional_laptops_count').val()
				if parseInt(laptop_count) > 0
					cost = parseInt(laptop_count) * laptop
					$('#add_on_equipment_cost').html("<b>$" + cost + "</b>")
				else
					cost = 0
					$('#add_on_equipment_cost').html("<b>$" + cost + "</b>")

		calculate_add_on_costs = ->
			choice = $('#event_location_id :selected').text()
			$.ajax("/locations/get_room_type_id?name=#{choice}", async: false).success (result) ->
				sum_and_input_add_on_costs(result.name)
		
		parseThisDollar = (d) ->
			c = d.replace(/(<([^>]+)>)/ig,"").split("$")
			return parseInt(c[1])

		total_costs = ->
			all_in_one = parseThisDollar($('#all_in_one_cost').html())
			add_ons = parseThisDollar($('#add_on_equipment_cost').html())
			
			if (all_in_one > 0) or (add_ons > 0)
				total_cost = all_in_one + add_ons
				$('#sum_total').html("<b>$" + total_cost + "</b>")
			else
				$('#sum_total').html("<b>$0</b>")

		$('#addl_next').click -> 
			names = window.names
			current = ""
			get_text element for element in names
			calculate_all_in_one_cost()
			calculate_add_on_costs()
			total_costs()

		$('#new_event').on("ajax:success", (e, data, statuss, xhr) ->
			$('#part5').hide()
			$('#success').fadeIn("slow")
		).on "ajax:error", (e, data, status, xhr) ->
			$('#part5').hide()
			$('#failure').fadeIn("slow")

