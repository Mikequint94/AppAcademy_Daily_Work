import Search from './search';
import { connect } from 'react-redux';
import {fetchBenches} from '../actions/bench_actions';
import {asArray} from '../reducers/selectors';

const mapStateToProps = state => ({
  benches: asArray(state.entities)
});

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
