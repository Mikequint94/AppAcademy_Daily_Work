class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.el = el;
    this.userId = this.$el.data("user-id") || options.userId;

    this.followState = this.$el.data("initial-follow-state") || options.followState;

    this.followState = this.followState.toString();
    console.log(this.followState);
    this.render();
    this.handleClick();
  }

  render() {
    // this.$el.prop("disabled", false);

    if (this.followState === "false") {
      this.$el.css('background-color', 'cyan');
      this.$el.text("Follow!");
    } else {
      this.$el.css('background-color', 'lime');
      this.$el.text("Unfollow!");
    }
  }

  handleClick() {
    const realThis = this;
    $(this.$el).on('click', (event) => {
      event.preventDefault();
      if (realThis.followState === "false") {
        $.ajax({
          url: `/users/${realThis.userId}/follow`,
          type: 'POST',
          dataType: 'JSON',
          success() {
            console.log('Followed');
            realThis.followState = "true";
            // realThis.$el.prop("disabled", true);
            realThis.$el.css('background-color', 'grey');
            realThis.render();
          }
        });
      } else {
        $.ajax({
          url: `/users/${realThis.userId}/follow`,
          type: 'DELETE',
          dataType: 'JSON',
          success() {
            console.log('Unfollowed');
            realThis.followState = "false";
            realThis.render();
          }
        });
      }
    });
  }

}


module.exports = FollowToggle;
