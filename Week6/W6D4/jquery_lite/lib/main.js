const DOMNodeCollection = require('./dom_node_collection.js');


function $l(selector) {
  let nodeList = [];
  if (typeof selector === "string") {
    nodeList = document.querySelectorAll(selector);
    // console.log(nodeList);
    nodeList = Array.from(nodeList);
    return new DOMNodeCollection(nodeList);
  } else if (selector instanceof HTMLElement) {
    nodeList.push(selector);
    return new DOMNodeCollection(nodeList);
  }
  // ;

  return nodeList;
}

window.$l = $l;
