const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$( () => {
  $('button.follow-toggle').each( function (index, el) {
    new FollowToggle(el);
  });
  $('nav.users-search').each( function (index, el) {
    new UsersSearch(el);
  });
  $('nav.followers').each( function (index, el) {
    new UsersSearch(el);
  });
});
