var companies = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/search/typeahead/%QUERY',
    wildcard: '%QUERY'
  }
});

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
      document.location.href = '/search/' + this.value;
      return false; // prevent the button click from happening
    }
  });
})
