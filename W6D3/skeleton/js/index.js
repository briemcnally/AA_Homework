console.log("Hello from the JavaScript console!");

// Your AJAX request here


$.ajax({
  method: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: function(data) {
    console.log("The weather is: ");
    console.log(data);
  }
});

// Add another console log here, outside your AJAX request
console.log("Completed AJAX request!!!");

//When does the request get sent?
//as soon as the page is loaded. 

//When does the response come back?
//When the server completes the request

//What is the current weather in NY?
//temp 275.79kelvin 10008 pressure and 47 humidity

//Did the page refresh?
//No.

//How could we use different HTTP methods in our request?
//$.get or $.post
