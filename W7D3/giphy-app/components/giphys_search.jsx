import React from 'react';

import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: ""
    }

    this.updateSearchBox = this.updateSearchBox.bind(this);
    this.searchForGif = this.searchForGif.bind(this);
  }

  updateSearchBox(event) {
    this.setState ({
      searchTerm: event.currentTarget.value
    })
  }

  searchForGif(event) {
    event.preventDefault();
    this.props.fetchSearchGiphys(this.state).then(() => {
      this.setState({
        searchTerm: ""
      })
    });
  }

  render() {
    const { giphys } = this.props;

    return (
      <div>
        <h1> Giphy Search Box! </h1>
        <input type="text" onChange={this.updateSearchBox} value={this.state.searchTerm} placeholder="Search for a Gif!"/>
        <button onClick={this.searchForGif}>Search!</button>
        <GiphysIndex giphys={giphys}/>
      </div>
    )
  }

}

export default GiphysSearch;
