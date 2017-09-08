class DOMNodeCollection {
  constructor(htmlements) {
    this.htmlements = htmlements;
  }
  html() {
    if (arguments) {
      this.htmlements.forEach( function (el) {
        el.innerHTML = arguments;
      });
    } else {
      return this.htmlements[0].innerHTML;
    }
  }
  empty() {
    this.htmlements.forEach( function (el) {
      el.innerHTML = "";
    });
  }


  attr(name, value){
    this.htmlements.forEach( function (el) {
      el.setAttribute(name, value);
    });
  }

  addClass(value) {
    this.attr('class', value);
  }

  removeClass() {
    this.htmlements.forEach( function (el) {
      el.removeAttribute('class');
    });
  }

}

module.exports = DOMNodeCollection;
