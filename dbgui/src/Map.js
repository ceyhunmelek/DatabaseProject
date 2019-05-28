import React,{Component} from 'react';
import { Map as LeafletMap, TileLayer, CircleMarker,Tooltip} from 'react-leaflet';

const position = [-15.89929, -47.49445]
class Map extends Component{
  state = {allDatas : [],greatest : 0}
  componentDidUpdate(prevProps){
    if (this.props.observation !== prevProps.observation) {
      console.log('http://104.248.25.93:9000/average/'+this.props.observation.yr+'/'+this.props.observation.mo+'/'+this.props.observation.type)
      fetch('http://104.248.25.93:9000/average/'+this.props.observation.yr+'/'+this.props.observation.mo+'/'+this.props.observation.type)
      .then(response => response.json())
      .then(json => this.setState({allDatas:json.data}))
      .catch( error => alert(error.message));
    }
  }

  render(){
      return(
        <LeafletMap style={{height:'100%'}}
        center={position}
        zoom={6}
        maxZoom={10}
        attributionControl={true}
        zoomControl={true}
        doubleClickZoom={true}
        scrollWheelZoom={true}
        dragging={true}
        animate={true}
        easeLinearity={0.35}
      >
        <TileLayer url='https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png'/>


        {this.state.allDatas.map(sdata=>(
        <CircleMarker key={sdata.wsid}
                      radius={(((sdata.average - this.state.allDatas[this.state.allDatas.length - 1].average) / (this.state.allDatas[0].average - this.state.allDatas[this.state.allDatas.length - 1].average) ) * 45 ) + 5}
                      center={[sdata.lat,sdata.lon]}>
          <Tooltip><span>Average Value : {sdata.average.toFixed(2)}</span></Tooltip>
        </CircleMarker>
        ))}

      </LeafletMap>
      )
  }
}
export default Map