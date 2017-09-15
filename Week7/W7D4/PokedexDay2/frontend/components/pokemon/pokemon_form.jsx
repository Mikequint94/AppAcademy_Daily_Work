import React from 'react';

class PokemonForm extends React.Component{
  constructor(){
    super();
    this.state = {
      name: "",
      attack: "",
      defense: "",
      poke_type: "",
      moves1: "",
      moves2: "",
      image_url: ""
    };

    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e){
    e.preventDefault();
    console.log(this.state);
    console.log(this.props);
    this.props.createSinglePokemon(this.state);
  }

  render(){
    const TYPES = [
      'fire',
      'electric',
      'normal',
      'ghost',
      'psychic',
      'water',
      'bug',
      'dragon',
      'grass',
      'fighting',
      'ice',
      'flying',
      'poison',
      'ground',
      'rock',
      'steel'
    ];

    const dropdown = TYPES.map((type) => (
      <option value={type}>{type}</option>
    ));

    return(
      <form className="pokemon-form">
        Create New Pokemon! <br />
        <label>Name:
          <input onChange={this.update('name')}></input>
        </label>
        <br/>
        <label>Attack:
          <input onChange={this.update('attack')}></input>
        </label>
        <br/>
        <label>Defense:
          <input onChange={this.update('defense')}></input>
        </label>
        <br/>
        <label>Poke Type:
          <select onChange={this.update('poke_type')}>
            {dropdown}
          </select>
        </label>
        <br/>
        <label>Move 1:
          <input onChange={this.update('moves1')}></input>
        </label>
        <br />
        <label>Move 2:
          <input onChange={this.update('moves2')}></input>
        </label>
        <br />
        <label>Image URL:
          <input onChange={this.update('image_url')}></input>
        </label>
        <button onClick={this.handleSubmit}>Submit</button>
      </form>
    );
  }
}

export default PokemonForm;
