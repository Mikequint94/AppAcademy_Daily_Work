import {connect} from 'react-redux';
import {receiveNewPoke, createSinglePokemon} from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';


const mapStateToProps = state => ({
});

const mapDispatchToProps = dispatch => ({
  receiveNewPoke: poke => dispatch(receiveNewPoke(poke)),
  createSinglePokemon: data => dispatch(createSinglePokemon(data))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
