$(document).ready(function() {
  $('.item-search-txt').keyup(function(event) {
    $(this).on("keyup keypress", function(event) {
      if (event.keyCode == 13) {
        event.preventDefault();
        return false;
      }
    })
    var domain = window.location.origin;
    var inputText = $(this).val();
    var apiRequest = domain + "/api/v1/search?type=items&q=" + inputText + "&api_key=" + search_api_key;
    $.getJSON(apiRequest, function(items) {
      if (inputText === "") {
        $(".all-results").html("")
      }
      else {
        var itemLinks = items["results"].slice(0,5).map(function(item) {
          return "<a class='result' href='" + domain + "/" + item.store + "/items/" + item.id + "'>" + item.title + "</a><br>"
        });
        $(".all-results").html(itemLinks)
      }
    });
  });
})
