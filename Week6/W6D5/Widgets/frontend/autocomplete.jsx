import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';


class Autocomplete extends React.Component{
  constructor(props) {
    super(props);
    this.names = props.namesList;
    this.state={ inputVal: ""};
    this.handleClick = this.handleClick.bind(this);
  }

  handleInput(e) {
    this.setState({inputVal: e.target.value });
  }
  resetInput(e) {
    e.preventDefault();
    this.setState({inputVal: ""});
  }

  matches() {
    const matches = [];
    if (this.state.inputVal.length === 0) {
      return this.names;
    }
    this.names.forEach(name => {
      let subname = name.slice(0, this.state.inputVal.length);
      if (subname.toLowerCase() === this.state.inputVal.toLowerCase()) {
        matches.push(name);
      }
    });
    if (matches.length === 0) {
      matches.push("No matches found");
    }
    return matches;
  }

  handleClick(e) {
    this.setState({inputVal: e.target.innerText});

  }

  render() {
    const names =  this.matches().map((name)=> {
      return (
      <li key= {name+"li"} onClick={this.handleClick } > {name} </li>
      );
    });
    return (
      <div className="autocomplete">
        <input id="searchBox" placeholder="Search the list..."value={this.state.inputVal} onChange={this.handleInput.bind(this)} />
        <button onClick={this.resetInput.bind(this)}>Reset</button>
        <ul>
          <ReactCSSTransitionGroup
           transitionName='auto'
           transitionEnterTimeout={200}
           transitionLeaveTimeout={500}>
           {names}
         </ReactCSSTransitionGroup>
        </ul>
      </div>
    );
  }
}

export default Autocomplete;
