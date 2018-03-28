import React from 'react';

import GiphysIndex from './giphys_index';

//renders the search bar and handles all the search logic
// keeps track of the query and triggers the AJAX request on submit
//renders the GiphysIndex
class GiphySearch extends React.Component {
  constructor() {
    super();
    this.state = { searchTerm: 'snowboard mountain' };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearchGiphys('snowboard+mountain');
  }

  handleChange(e) {
    this.setState({ searchTerm: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    let { giphys } = this.props;

    return(
      <div>
        <form className="search-bar">
          <input value={this.state.searchTerm} onChange={this.handleChange}/>
          <button type="submit" onClick={this.handleSubmit}>Search Giphys</button>
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphySearch;
