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
 
       var building = "<option value=''>Building</option>";
       var battery = "<option value=''>Battery</option>";
       var column = "<option value=''>None</option>";
       var elevator= "<option value=''>None</option>";
 
       $(building).appendTo("#intervention_building_id select");
       $(battery).appendTo("#intervention_battery_id select");
       $(column).appendTo("#intervention_column_id select"); 
       $(elevator).appendTo("#intervention_elevator_id select");
    }
 
    $("#intervention_customer_id select").change(function () {
       
       $("#intervention_building_id").show();
       var value = $(this).val();
 
       if (value == "") {
          $("#intervention_building_id").hide()
          $("#intervention_battery_id").hide()
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          
          $("#intervention_building_id option").remove()
          $("#intervention_battery_id option").remove()
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()

          var building = "<option value=''>Building</option>";
          var battery = "<option value=''>Battery</option>";
          var column = "<option value=''>None</option>";
          var elevator= "<option value=''>None</option>";
          
          $(building).appendTo("#intervention_building_id select");
          $(battery).appendTo("#intervention_battery_id select");
          $(column).appendTo("#intervention_column_id select"); 
          $(elevator).appendTo("#intervention_elevator_id select");
          
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
 
    
    $("#intervention_building_id select").change(function () {
       var value = $(this).val();
 
       if (value == "") {
          $("#intervention_battery_id").hide()
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          $("#intervention_battery_id option").remove()
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()
 
          var battery = "<option value=''>Battery</option>";
          var column = "<option value=''>None</option>";
          var elevator= "<option value=''>None</option>";
 
          $(battery_option).appendTo("#intervention_battery_id select");
          $(column_option).appendTo("#intervention_column_id select"); 
          $(elevator_option).appendTo("#intervention_elevator_id select");
 
       } else { console.log("haha");
          $("#intervention_battery_id").show()
 
          $.ajax({
          dataType: "json",
          cache: false,
          url: "/get_batteries/" + value,
          timeout: 5000,
          error: (XMLHttpRequest, errorTextStatus, error) => {
             alert("Failed to submit:" + errorTextStatus + error);
          },
          success: (data) => {
             $("#intervention_battery_id option").remove()
             $("#intervention_column_id option").remove()
             $("#intervention_elevator_id option").remove()
 
             var battery = "<option value=''>Battery</option>";
             var column = "<option value=''>None</option>";
             var elevator= "<option value=''>None</option>";
 
             $(battery).appendTo("#intervention_battery_id select");
             $(column).appendTo("#intervention_column_id select"); 
             $(elevator).appendTo("#intervention_elevator_id select");
 
             for(var i = 0; i < data.length; i++){ 
               $("#intervention_battery_id select").append('<option value="' + data[i]["id"] +  '">' + data[i]["id"]+'</option>');
          };
          }
          });
       }
    });
 
    $("#intervention_battery_id select").change(function () {
       var value = $(this).val();
 
       if (value == "") {
          $("#intervention_column_id").hide()
          $("#intervention_elevator_id").hide()
 
          $("#intervention_column_id option").remove()
          $("#intervention_elevator_id option").remove()
 
          var column = "<option value=''>None</option>";
          var elevator= "<option value=''>None</option>";
 
          $(column).appendTo("#intervention_column_id select"); 
          $(elevator).appendTo("#intervention_elevator_id select");
 
       } else {
          $("#intervention_column_id").show();
 
          $.ajax({
             dataType: "json",
             cache: false,
             url: "/get_columns/" + value,
             timeout: 5000,
             error: (XMLHttpRequest, errorTextStatus, error) => {
                alert("Failed to submit:" + errorTextStatus + error);
             },
             success: (data) => {
                $("#intervention_column_id option").remove()
                $("#intervention_elevator_id option").remove()

                var column = "<option value=''>None</option>";
                var elevator= "<option value=''>None</option>";
                
                $(column).appendTo("#intervention_column_id select"); 
                $(elevator).appendTo("#intervention_elevator_id select");
                
                for(var i = 0; i < data.length; i++){ 
                  $("#intervention_column_id select").append('<option value="' + data[i]["id"] +  '">' + data[i]["id"]+'</option>');
             };
             }
          });
       }
    });
 
    $("#intervention_column_id select").change(function () {
       var value = $(this).val();
 
       if (value == "") {
          $("#intervention_elevator_id").hide()
 
          $("#intervention_elevator_id option").remove()
 
          var elevator= "<option value=''>None</option>";
          
          $(elevator).appendTo("#intervention_elevator_id select");
 
       } else {
          $("#intervention_elevator_id").show();
 
          $.ajax({
             dataType: "json",
             cache: false,
             url: "/get_elevators/" + value,
             timeout: 5000,
             error: (XMLHttpRequest, errorTextStatus, error) => {
                alert("Failed to submit:" + errorTextStatus + error);
             },
             success: (data) => {
                $("#intervention_elevator_id option").remove()
 
                var elevator= "<option value=''>None</option>";
 
               
                $(elevator).appendTo("#intervention_elevator_id select");
 
                for(var i = 0; i < data.length; i++){ 
                  $("#intervention_elevator_id select").append('<option value="' + data[i]["id"] +  '">' + data[i]["id"]+'</option>');
             };
             }
          });
       }
    });
 
 });