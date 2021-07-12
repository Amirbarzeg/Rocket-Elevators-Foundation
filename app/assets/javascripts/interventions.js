$(function () {

    // # If a selection has NOT been made yet
    if ($("#intervention_customer_id select").val() == "") {
       // # Hide all the other fields 
       $("#intervention_building_id").hide()
       $("#intervention_battery_id").hide()
       $("#intervention_column_id").hide()
       $("#intervention_elevator_id").hide()
 
       // # Clear the option fields of all the other select fields
       $("#intervention_building_id option").remove()
       $("#intervention_battery_id option").remove()
       $("#intervention_column_id option").remove()
       $("#intervention_elevator_id option").remove()
 
       // # Create an option field for each select
       var building_option = "<option value=''>Building</option>";
       var battery_option = "<option value=''>Battery</option>";
       var column_option = "<option value=''>None</option>";
       var elevator_option = "<option value=''>None</option>";
 
       // # Insert that option element
       $(building_option).appendTo("#intervention_building_id select");
       $(battery_option).appendTo("#intervention_battery_id select");
       $(column_option).appendTo("#intervention_column_id select"); 
       $(elevator_option).appendTo("#intervention_elevator_id select");
    }
 
    // # We want something to happen when the value changes
    $("#intervention_customer_id select").change(function () {
       // # Show certain fields
       $("#intervention_building_id").show();
 
       // # Get the value of the selected option
       var value = $(this).val();
 
       if (value == "") {
          // # Re-hide all the other fields
          $("#intervention_building_id").hide()
          $("#intervention_battery_id").hide()
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          // # Clear the option fields of all the other select fields
          $("#intervention_building_id option").remove()
          $("#intervention_battery_id option").remove()
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()
 
          // # Create an option field for each select
          var building_option = "<option value=''>Building</option>";
          var battery_option = "<option value=''>Battery</option>";
          var column_option = "<option value=''>None</option>";
          var elevator_option = "<option value=''>None</option>";
 
          // # Insert that option element
          $(building_option).appendTo("#intervention_building_id select");
          $(battery_option).appendTo("#intervention_battery_id select");
          $(column_option).appendTo("#intervention_column_id select"); 
          $(elevator_option).appendTo("#intervention_elevator_id select");
 
       // # If a selection has been made
       } else {
          // # Send the request and update dropdown
          $.ajax({
             dataType: "json",
             cache: false,
             url: "/get_buildings/" + value,
             timeout: 5000,
             error: (XMLHttpRequest, errorTextStatus, error) => {
                alert("Failed to submit:" + errorTextStatus + error);
             },
             success: (data) => {
                // # Clear the option fields of all the other select fields
                $("#intervention_building_id option").remove()
                $("#intervention_battery_id option").remove()
                $("#intervention_column_id option").remove()
                $("#intervention_elevator_id option").remove()
 
                // # Create an option field for each select
                var building_option = "<option value=''>Building</option>";
                var battery_option = "<option value=''>Battery</option>";
                var column_option = "<option value=''>None</option>";
                var elevator_option = "<option value=''>None</option>";
 
                // # Insert that option element
                $(building_option).appendTo("#intervention_building_id select");
                $(battery_option).appendTo("#intervention_battery_id select");
                $(column_option).appendTo("#intervention_column_id select"); 
                $(elevator_option).appendTo("#intervention_elevator_id select");
 
                // # Fill the select field
                $.each(data, function (i, j) {
                   option = "<option value=\"" + j.id + "\">" + j.full_name_of_the_building_administrator + "</option>";
                   $(option).appendTo("#intervention_building_id select");
                });
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
       } else {
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