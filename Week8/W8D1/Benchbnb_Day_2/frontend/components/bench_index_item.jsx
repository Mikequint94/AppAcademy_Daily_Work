import React from 'react';

const BenchIndexItem = ({bench}) => {
  return (
    <ul>
      <li>{bench.description}</li>
    </ul>
  );
};

export default BenchIndexItem;
