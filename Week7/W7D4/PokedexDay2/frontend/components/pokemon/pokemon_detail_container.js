import {receivePoke, requestSinglePokemon} from '../../actions/pokemon_actions';
import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import selectAllPokemon from '../../reducers/selectors';
import {withRouter} from 'react-router-dom';

const mapStateToProps = state => ({
  pokemon: state.entities.pokemon,
  items: state.entities.items
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: pokeId => dispatch(requestSinglePokemon(pokeId)),
  receivePoke: pokeId => dispatch(receivePoke(pokeId))
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail));
