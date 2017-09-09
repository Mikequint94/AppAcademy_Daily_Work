import React from 'react';

class Weather extends React.Component{
  constructor(props) {
    super(props);
    this.state = {location: "", weatherData: {weather: [{description:"hello"}] , main: {temp: ""}}, name: "" };
  }

  componentDidMount() {
    let myThis = this;
    navigator.geolocation.getCurrentPosition( (position) => {
      this.setState({location: [position.coords.latitude,
        position.coords.longitude]});
      var request = new XMLHttpRequest();
      request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${this.state.location[0]}&lon=${this.state.location[1]}&APPID=3a8d418f72b6fdf953c96631c2a72f17`, true);

      request.onload = function() {
        if (request.status >= 200 && request.status < 400) {
          // Success!
          // myThis.state.weatherData = JSON.parse(request.responseText);
          myThis.setState( { weatherData: JSON.parse(request.responseText) } );
        } else {
          // We reached our target server, but it returned an error
          console.log("Error retrieving Weather Data from API");
        }
      };

      request.onerror = function() {
        // There was a connection error of some sort
      };

      request.send();

    });
  }

  render() {
    return (
      <div>
      <h2>Current Location: {this.state.weatherData.name}</h2>
      <h2>Lat: {parseFloat(this.state.location[0]).toFixed(3)} Long: {parseFloat(this.state.location[1]).toFixed(3)}</h2>
      <h2> Weather: {this.state.weatherData.weather[0].description} </h2>
      <h2> Temperature: {Math.floor((this.state.weatherData.main.temp -273.15)*1.8 + 32)} degrees Fahrenheit </h2>
    </div>
    );
  }
}

export default Weather;



// http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID={APIKEY}
// APIKEY =  3a8d418f72b6fdf953c96631c2a72f17
