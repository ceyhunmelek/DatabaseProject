import React, {Component} from 'react';
import Map from './Map';

class Main extends Component{
  constructor() {
    super();
    this.state = {yr:'',mo:'',type:''};
  }
  
  showIt = () => {
    this.setState({yr:document.getElementById("year").value});
    this.setState({mo:document.getElementById("month").value});
    this.setState({type:document.getElementById("valueType").value});
  }

  render(){
      return(
        <div className="container-fluid" style={{height:'100vh'}}>
          <div className="row h-100">
              <div className="col-md-3 bg-dark">

                <h2 className="text-light" style={{marginTop:'10px'}} >Best DB Project Ever</h2>

                <div className="input-group mb-3">
                  <div className="input-group-prepend">
                    <label className="input-group-text" htmlFor="year">Year</label>
                  </div>
                  <select className="custom-select" id="year">
                    <option value="2000">2000</option>
                    <option value="2001">2001</option>
                    <option value="2002">2002</option>
                    <option value="2003">2003</option>
                    <option value="2004">2004</option>
                    <option value="2005">2005</option>
                    <option value="2006">2006</option>
                    <option value="2007">2007</option>
                    <option value="2008">2008</option>
                    <option value="2009">2009</option>
                    <option value="2010">2010</option>
                    <option value="2011">2011</option>
                    <option value="2012">2012</option>
                    <option value="2013">2013</option>
                    <option value="2014">2014</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                  </select>
                </div>

                <div className="input-group mb-3">
                  <div className="input-group-prepend">
                    <label className="input-group-text" htmlFor="month">Month</label>
                  </div>
                  <select className="custom-select" id="month">
                    <option value="-">All Year</option>
                    <option value="-01-">1</option>
                    <option value="-02-">2</option>
                    <option value="-03-">3</option>
                    <option value="-04-">4</option>
                    <option value="-05-">5</option>
                    <option value="-06-">6</option>
                    <option value="-07-">7</option>
                    <option value="-08-">8</option>
                    <option value="-09-">9</option>
                    <option value="-10-">10</option>
                    <option value="-11-">11</option>
                    <option value="-12-">12</option>
                  </select>
                </div>

                <div className="input-group mb-3">
                  <div className="input-group-prepend">
                    <label className="input-group-text" htmlFor="valueType">Value Type</label>
                  </div>
                  <select className="custom-select" id="valueType">
                    <option value="1">Precipitation</option>
                    <option value="2">Air Pressure</option>
                    <option value="3">Maximum Air Pressure</option>
                    <option value="4">Minimum Air Pressure</option>
                    <option value="5">Solar Radiation</option>
                    <option value="6">Air Temperature</option>
                    <option value="7">Dew Point Temperature</option>
                    <option value="8">Maximum Temperature</option>
                    <option value="9">Maximum Dew Point Temperature</option>
                    <option value="10">Minimum Temperature</option>
                    <option value="11">Minimum Dew Point Temperature</option>
                    <option value="12">Relative Humid</option>
                    <option value="13">Maximum Relative Humid</option>
                    <option value="14">Minimum Relative Humid</option>
                    <option value="15">Wind Speed</option>
                    <option value="16">Wind Direction</option>
                    <option value="17">Wind Gust</option>
                  </select>
                </div>

                <button type="button" onClick={this.showIt} className="btn btn-info btn-block">Show It!</button>
              </div>
              <div className="col-md-9 bg-light px-0">
                <Map observation={this.state} className="col-md-9 bg-light"></Map>
              </div>
          </div>
      </div>
    )
  }
}

export default Main;