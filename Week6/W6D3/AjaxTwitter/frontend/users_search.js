const APIUtil = require('./api_util');
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find('input[name=username]');
    this.$ul = this.$el.find('.users');
    this.handleInput('input');
    this.$input.on('input', this.handleInput.bind(this));
  }
  handleInput(event) {
    // console.log(this.$input.val());
    APIUtil.searchUsers(this.$input.val())
      .then(users => this.renderResults(users));

  }
  renderResults(users) {
    this.$ul.empty();
    for (let i = 0; i < users.length; i++) {
      let user = users[i];
      let $a = $('<a></a>');
      $a.text(user.username);
      $a.attr('href', `/users/${user.id}`);
      // console.log(user);

      let $button = $(`<button></button>`);
      new FollowToggle($button, {
        userId: user.id,
        followState: user.followed
      });
      let $li = $('<li></li>');
      $li.append($a);
      $li.append("....");
      $li.append($button);
      this.$ul.append($li);
    }
  }
}

module.exports = UsersSearch;
