import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';


class Autocomplete extends React.Component{
  constructor(props) {
    super(props);
    this.names = props.namesList;
    this.state={ origin: "", destination: ""};
    this.handleClick1 = this.handleClick1.bind(this);
    this.handleClick2 = this.handleClick2.bind(this);
  }

  handleInput1(e) {
    this.setState({origin: e.target.value });
  }
  handleInput2(e) {
    this.setState({destination: e.target.value });
  }
  resetInput(e) {
    e.preventDefault();
    this.setState({origin: "", destination: ""});
  }
  searchInput(e) {
    e.preventDefault();
    console.log(this.state.origin);
    console.log(this.state.destination);
  }

  matches1() {
    const matches1 = [];
    if (this.state.origin.length === 0) {
      return this.names;
    }
    this.names.forEach(name => {
      let subname = name.slice(0, this.state.origin.length);
      if (subname.toLowerCase() === this.state.origin.toLowerCase()) {
        matches1.push(name);
      }
    });
    if (matches1.length === 0) {
      matches1.push("No matches found");
    }
    return matches1;
  }
  matches2() {
    const matches2 = [];
    if (this.state.destination.length === 0) {
      return this.names;
    }
    this.names.forEach(name => {
      let subname = name.slice(0, this.state.destination.length);
      if (subname.toLowerCase() === this.state.destination.toLowerCase()) {
        matches2.push(name);
      }
    });
    if (matches2.length === 0) {
      matches2.push("No matches found");
    }
    return matches2;
  }

  handleClick1(e) {
    this.setState({origin: e.target.innerText});
  }
  handleClick2(e) {
    this.setState({destination: e.target.innerText});
  }

  render() {
    const origins =  this.matches1().slice(0,12).map((name)=> {
      return (
      <li key= {name+"li"} onClick={this.handleClick1 } > {name} </li>
      );
    });
    const destinations =  this.matches2().slice(0,12).map((name)=> {
      return (
      <li key= {name+"li"} onClick={this.handleClick2 } > {name} </li>
      );
    });
    return (
      <div className="autocomplete">
        <button onClick={this.searchInput.bind(this)}>Search</button>
        <button onClick={this.resetInput.bind(this)}>Reset</button>
        <br/>
        <ul>
           <div className="originList">
             <input id="searchBox" placeholder="Search the list..."value={this.state.origin} onChange={this.handleInput1.bind(this)} />
             <p>Origin</p>
             <ReactCSSTransitionGroup
               transitionName='autoO'
               transitionEnterTimeout={200}
               transitionLeaveTimeout={500}>
             {origins}
           </ReactCSSTransitionGroup>
           </div>
           <div className="destinationList">
             <input id="searchBox" placeholder="Search the list..."value={this.state.destination} onChange={this.handleInput2.bind(this)} />
             <p>Destination</p>
             <ReactCSSTransitionGroup
               transitionName='autoD'
               transitionEnterTimeout={200}
               transitionLeaveTimeout={500}>
             {destinations}
           </ReactCSSTransitionGroup>
           </div>

        </ul>
      </div>
    );
  }
}

export default Autocomplete;
