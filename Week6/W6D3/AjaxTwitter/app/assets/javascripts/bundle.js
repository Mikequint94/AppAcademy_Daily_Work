/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(2);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(3);
const FollowToggle = __webpack_require__(1);

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


/***/ }),
/* 3 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map