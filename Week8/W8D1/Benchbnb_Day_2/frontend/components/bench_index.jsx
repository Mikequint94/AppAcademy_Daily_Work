import React from 'react';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  constructor(){
    super();
  }

  componentDidMount() {
    this.props.fetchBenches();
  }


  render () {
    const benches = this.props.benches.map(bench => (
      <BenchIndexItem bench={bench} key={bench.id}/>
    ));
    // console.log(benches);
    return (
      <div>
        {benches}

      </div>
    );
  }
}

export default BenchIndex;
