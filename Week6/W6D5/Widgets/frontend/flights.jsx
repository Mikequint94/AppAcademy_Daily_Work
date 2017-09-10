import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';
// import { DateRangePicker, SingleDatePicker, DayPickerRangeController } from 'react-dates';
// import 'react-dates/lib/css/_datepicker.css';
// import css from 'file.css';

var rapid = new RapidAPI('default-application_59b4e652e4b07e6c5c5a7189', '182e78f1-d1e7-48d9-aab8-54f64586641c');

class Flights extends React.Component{
  constructor(props) {
    super(props);
    this.state = {origin: '', destination: '', departureDate: '2017-09-12 00:00:00', price: "", duration: "", airline: "", numLayovers: ""};
    this.names = props.namesList;
    this.handleClick1 = this.handleClick1.bind(this);
    this.handleClick2 = this.handleClick2.bind(this);
  }

  requestFlights() {
    let myThis = this;
    rapid.call('GoogleFlightsAPI', 'searchSingleTrip', {
    	'apiKey': 'AIzaSyC3xvsG93J5qimVaI0pkqmtDutfW-C7h30',
    	'origin': `${this.state.origin}`,
    	'destination': `${this.state.destination}`,
    	'passengersAdultCount': '1',
    	'passengersChildCount': '0',
    	'fromDate': `${this.state.departureDate}`

    }).on('success', function (payload) {
    	 console.log(payload);
    	//  console.log(payload.trips);
    	 myThis.setState({price: payload.trips.tripOption[0].saleTotal});
    	 myThis.setState({duration: payload.trips.tripOption[0].slice[0].duration});
    	 myThis.setState({airline: payload.trips.tripOption[0].pricing[0].fare[0].carrier});
    	 myThis.setState({numLayovers: payload.trips.tripOption[0].slice[0].segment.length -1});
    }).on('error', function (payload) {
    	 console.log("errors");
    });
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
    this.requestFlights();
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
    let airlineCodes = {'UA': 'United Airlines', 'MQ': 'American Eagle', 'B6': 'JetBlue Airways', 'DL': 'Delta Air Lines', 'NK': 'Spirit Airways', 'WN': 'Southwest Airlines', 'US': 'US Airways' }
    return (
      <div>
        <div className="flightinfo">
          <h1>Flights</h1>

          <h3>Here are some flight details from {this.state.origin.toUpperCase()} to {this.state.destination.toUpperCase()} on {this.state.departureDate.slice(0,10)}</h3>
         <h3>Cheapest Price: {this.state.price}</h3>
         <h3>Flight Duration: {Math.floor(this.state.duration/60)}:{this.state.duration%60} with {this.state.numLayovers} Layovers</h3>
         <h3>Airline: {airlineCodes[this.state.airline]} </h3>
        </div>
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
      </div>
    );
  }

  }

  export default Flights;
