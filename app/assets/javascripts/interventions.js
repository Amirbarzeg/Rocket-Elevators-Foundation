$(function () {

    if ($("#intervention_customer_id select").val() == "") {
     
       $("#intervention_building_id").hide()
       $("#intervention_battery_id").hide()
       $("#intervention_column_id").hide()
       $("#intervention_elevator_id").hide()

       $("#intervention_building_id option").remove()
       $("#intervention_battery_id option").remove()
       $("#intervention_column_id option").remove()
       $("#intervention_elevator_id option").remove()
 
       var building_option = "<option value=''>Building</option>";
       var battery_option = "<option value=''>Battery</option>";
       var column_option = "<option value=''>None</option>";
       var elevator_option = "<option value=''>None</option>";
 
       $(building_option).appendTo("#intervention_building_id select");
       $(battery_option).appendTo("#intervention_battery_id select");
       $(column_option).appendTo("#intervention_column_id select"); 
       $(elevator_option).appendTo("#intervention_elevator_id select");
    }
 
    $("#intervention_customer_id select").change(function () {
       
       $("#intervention_building_id").show();
       var value = $(this).val();
 
       if (value == "") {
          $("#intervention_building_id").hide()
          $("#intervention_battery_id").hide()
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          // # Clear the option fields of all the other select fields
          $("#intervention_building_id option").remove()
          $("#intervention_battery_id option").remove()
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()

          var building_option = "<option value=''>Building</option>";
          var battery_option = "<option value=''>Battery</option>";
          var column_option = "<option value=''>None</option>";
          var elevator_option = "<option value=''>None</option>";
 
          $(building_option).appendTo("#intervention_building_id select");
          $(battery_option).appendTo("#intervention_battery_id select");
          $(column_option).appendTo("#intervention_column_id select"); 
          $(elevator_option).appendTo("#intervention_elevator_id select");
       } else { 
          $.ajax({
             dataType: "json",
             method: "GET",
             url: "/get_buildings/" + value,
             timeout: 5000,
             error: (XMLHttpRequest, errorTextStatus, error) => {
                alert("Failed to submit:" + errorTextStatus + error);
             },
             success: (data) => {
                $("#intervention_building_id option").remove()
                var building_option = "<option value=''>Building</option>";
                $("#intervention_building_id select").append(building_option);
                  for(var i = 0; i < data.length; i++){ data
                     $("#intervention_building_id select").append('<option value="' + data[i]["id"] +  '">' + data[i]["id"]+'</option>');
                };
             }
          });
       }
    });
 
    // # We want something to happen when the value changes
    $("#intervention_building_id select").change(function () {
       // # Get the value of the selected option
       var value = $(this).val();
 
       if (value == "") {
          // # Re-hide the following fields
          $("#intervention_battery_id").hide()
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          // # Clear the option fields of all the other select fields
          $("#intervention_battery_id option").remove()
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()
 
          // # Create an option field for each select
          var battery_option = "<option value=''>Battery</option>";
          var column_option = "<option value=''>None</option>";
          var elevator_option = "<option value=''>None</option>";
 
          // # Insert that option field
          $(battery_option).appendTo("#intervention_battery_id select");
          $(column_option).appendTo("#intervention_column_id select"); 
          $(elevator_option).appendTo("#intervention_elevator_id select");
 
       // # If a selection has been made
       } else { console.log("haha");
          // # Show the battery field
          $("#intervention_battery_id").show()
 
          // # Send the request and update course dropdown
          $.ajax({
          dataType: "json",
          cache: false,
          url: "/get_batteries/" + value,
          timeout: 5000,
          error: (XMLHttpRequest, errorTextStatus, error) => {
             alert("Failed to submit:" + errorTextStatus + error);
          },
          success: (data) => {
             // # Clear the option fields of all the other select fields
             $("#intervention_battery_id option").remove()
             $("#intervention_column_id option").remove()
             $("#intervention_elevator_id option").remove()
 
             // # Create an option field for each select
             var battery_option = "<option value=''>Battery</option>";
             var column_option = "<option value=''>None</option>";
             var elevator_option = "<option value=''>None</option>";
 
             // # Insert that option field
             $(battery_option).appendTo("#intervention_battery_id select");
             $(column_option).appendTo("#intervention_column_id select"); 
             $(elevator_option).appendTo("#intervention_elevator_id select");
 
             // # Fill the select field
             $.each(data, function (i, j) {
                option = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                $(option).appendTo("#intervention_battery_id select");
             });
          }
          });
       }
    });
 
    // # We want something to happen when the value changes
    $("#intervention_battery_id select").change(function () {
       // # Get the value of the selected option
       var value = $(this).val();
 
       if (value == "") {
          // # Re-hide the following fields
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          // # Clear the option fields of all the other select fields
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()
 
          // # Create an option field for each select
          var column_option = "<option value=''>None</option>";
          var elevator_option = "<option value=''>None</option>";
 
          // # Insert that option field
          $(column_option).appendTo("#intervention_column_id select"); 
          $(elevator_option).appendTo("#intervention_elevator_id select");
 
       // # If a selection has been made
       } else {
          // # Show/Hide appropriate elements
          $("#intervention_column_id").show();
 
          // # Send the request and update course dropdown
          $.ajax({
             dataType: "json",
             cache: false,
             url: "/get_columns/" + value,
             timeout: 5000,
             error: (XMLHttpRequest, errorTextStatus, error) => {
                alert("Failed to submit:" + errorTextStatus + error);
             },
             success: (data) => {
                // # Clear the option fields of all the other select fields
                $("#intervention_column_id option").remove()
                $("#intervention_elevator_id option").remove()
 
                // # Create an option field for each select
                var column_option = "<option value=''>None</option>";
                var elevator_option = "<option value=''>None</option>";
 
                // # Insert that option field
                $(column_option).appendTo("#intervention_column_id select"); 
                $(elevator_option).appendTo("#intervention_elevator_id select");
 
                // # Fill the select field
                $.each(data, function (i, j) {
                   option = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                   $(option).appendTo("#intervention_column_id select");
                });
             }
          });
       }
    });
 
    // # We want something to happen when the value changes
    $("#intervention_column_id select").change(function () {
       // # Get the value of the selected option
       var value = $(this).val();
 
       if (value == "") {
          // # Re-hide the following fields
          $("#intervention_elevator_id").hide()
 
          // # Clear the option fields of all the other select fields
          $("#intervention_elevator_id option").remove()
 
          // # Create an option field for each select
          var elevator_option = "<option value=''>None</option>";
 
          // # Insert that option field
          $(elevator_option).appendTo("#intervention_elevator_id select");
 
       // # If a selection has been made
       } else {
          // # Show/Hide appropriate elements
          $("#intervention_elevator_id").show();
 
          // # Send the request and update the dropdown
          $.ajax({
             dataType: "json",
             cache: false,
             url: "/get_elevators/" + value,
             timeout: 5000,
             error: (XMLHttpRequest, errorTextStatus, error) => {
                alert("Failed to submit:" + errorTextStatus + error);
             },
             success: (data) => {
                // # Clear the option fields of all the other select fields
                $("#intervention_elevator_id option").remove()
 
                // # Create an option field for each select
                var elevator_option = "<option value=''>None</option>";
 
                // # Insert that option field 
                $(elevator_option).appendTo("#intervention_elevator_id select");
 
                // # Fill the select field
                $.each(data, function (i, j) {
                   option = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                   $(option).appendTo("#intervention_elevator_id select");
                });
             }
          });
       }
    });
 
 });