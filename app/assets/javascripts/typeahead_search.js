var companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/search/typeahead/%QUERY',
    wildcard: '%QUERY'
  }
});

function encodeQueryParams(data) {
   var ret = [];
   for (var key in data)
     ret.push(encodeURIComponent(key) + '=' + encodeURIComponent(data[key]));
   return ret.join('&');
}

$(document).ready(function() {
  console.log("ayyy");
  $('#search .typeahead').typeahead({
    highlight: true
  },
  {
    name: 'companies',
    display: 'name',
    source: companies,
    templates: {
      suggestion: function(data) {
        var suggestion = "";
        switch(data.search_category) {
          case 'person':
            suggestion = '<div><a href="/users/' + data.id + '">' + data.name + '</a></div>';
            break;
          case 'company':
            suggestion = '<div><img class="tt-suggestion-img" src="' + data.image + '" /><a href="/companies/' + data.id + '">' + data.name + '</a></div>';
            break;
          case 'position':
            var params = {"exp_position": data.name};
            suggestion = '<div><a href="/search?' + encodeQueryParams(params) + '">' + data.name + '</a></div>';
            break;
          default:
            break;
        }
        return suggestion;
      }
    }
  });
  $('.navbar-input').on("keypress", function(e) {
    if (e.keyCode == 13) {
      console.log(this);
      var params = {"query": this.value};
      document.location.href = '/search?' + encodeQueryParams(params);
      return false; // prevent the button click from happening
    }
  });
})
