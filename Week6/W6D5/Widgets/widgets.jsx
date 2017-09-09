import React from 'react';
import ReactDOM from 'react-dom';
import Congrats from './congrats';

import Clock from './frontend/clock';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';
import Tabs from './frontend/tabs';


document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<Root/>, root);
	// ReactDOM.render(< Weather/>, root);
});

const names = ["Mike", "David", "Adrian", "Brian", "Jerry", "Tommy", "Betty", "Rebekah", "Nixon"];

const Panes = [
	{title: "I'm street smart", content: "You mean cause you minored in urban planning?"},
	{title: "How could it Be", content: "Little me had the power to be the best B in the league ya inevitably"},
	{title: "Whatcha Say?", content: "Cause this isnt what we need. We decided this"}
];
class Root extends React.Component {
	render() {
		return (
			<div>
				<Clock/>
				<Weather/>
				<Autocomplete namesList={names}/>
				<Tabs panes={Panes}/>
			</div>
		);
	}
}
