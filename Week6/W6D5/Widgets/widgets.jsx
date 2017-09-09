import React from 'react';
import ReactDOM from 'react-dom';
import Congrats from './congrats';

import Clock from './frontend/clock';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';


document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<Root/>, root);
	// ReactDOM.render(< Weather/>, root);
});

const names = ["Mike", "David", "Adrian", "Brian", "Jerry", "Tommy", "Betty", "Rebekah", "Nixon"];

class Root extends React.Component {
	render() {
		return (
			<div>
				<Clock/>
				<Weather/>
				<Autocomplete namesList={names}/>
			</div>
		);
	}
}
