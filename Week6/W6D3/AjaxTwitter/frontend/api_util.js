const APIUtil = {
  followUser: id => {

  },

  unfollowUser: id => {
    // ...
  },

  searchUsers: query => (
    $.ajax({
      url: '/users/search',
      dataType: 'json',
      method: 'GET',
      data: { query }
    })
  )

};

module.exports = APIUtil;
