// Finds assets by matching the attribute that contains the url to a file
// If none was found all are returned so they can all be updated.
function find_asset(element, attribute, query) {
  var scope = $(element + "[" + attribute + "]")
  var match = scope.filter(function() {
    return $(this).attr(attribute).match(query);
  })

  // Return all elements when no specific match was found
  return match.size() == 0 ? scope : match
}

// Replace the ? part of an element with a url attribute
function update_timestamp(element, attribute, replacement) {
  element.attr(attribute, element.attr(attribute).replace(/\?.+/, "") + "?" +  replacement)
}

function update_element(element, attribute, replacement) {
  update_timestamp(element, attribute, replacement)

  var clone = element.clone();
  clone.insertAfter(element)
}

function find_and_update(element, attribute, file) {
  console.log("Reloading " + file.type + " with filename " + file.name + ' beginning at ' + Date.now())
  find_asset(element, attribute, file.name).each(function() {
    update_timestamp($(this), attribute, file.timestamp)
  })
  
  console.log("Reloading " + file.type + " with filename " + file.name + ' at ' + Date.now())
}

//Create a client to our Faye server
var client = new Faye.Client('http://localhost:9292/faye', {
    timeout: 120
});



// Subscript to the files channel
var subscription = client.subscribe('/files', function(file) {
  if(file.type == "css") {
    find_and_update("link", "href", file)
  } else if (file.type == "js") {
    find_asset("script", "src", file.name).each(function() {
      update_element($(this), "src", file.timestamp)
    })
    
    console.log("Reloading " + file.type + " with filename " + file.name + ' at ' + Date.now())
    
  } else if (file.type == "image") {
    find_and_update("img", "src", file)
    find_and_update("link", "href", file)
  } else {
    console.log("Reloader didn't find elements that used the file " + file.name)
    window.location.reload();
  }
});
