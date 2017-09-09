import React from 'react';

class Autocomplete extends React.Component{
  constructor(props) {
    super(props);
    this.names = props.namesList;
    console.log(this.names);
    this.state={ inputVal: ""};
    this.handleClick = this.handleClick.bind(this);
    this.includedNames = this.names;
  }

  handleInput(e) {
    this.setState({inputVal: this.state.inputVal = e.target.value }/*, */);
    // this.names.filter((name) =>{
    //   this.includedNames = [];
    //   if (name.slice(0,this.state.inputVal.length +1) === this.state.inputVal) {
    //     this.includedNames.push(name);
    //   }
    // });

  }

  handleClick(e) {
    this.setState({inputVal: e.target.innerText});

  }

  render() {
    const names =  this.includedNames.map((name)=>(
      <li key= {name+"li"} onClick={this.handleClick } > {name} </li>
    ));
    return (
      <div className="autocomplete">
        <input id="searchBox" value={this.state.inputVal} onChange={this.handleInput.bind(this)} />
        <ul>
        {names}
        </ul>
      </div>
    );
  }
}

export default Autocomplete;
