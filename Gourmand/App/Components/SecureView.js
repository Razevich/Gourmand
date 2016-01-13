
"use strict";

var React = require("react-native");
var {
    Component,
    StyleSheet,
    Text,
    View,
    ListView,
} = React;

class SecureView extends Component {

    constructor(props) {
        super(props);
        this.state = {
            username: this.props.username,
            password: this.props.password,
            token: this.props.token,
            kitchens: this.props.kitchens
        }
    }
};

var KitchenList = React.createClass({
  getInitialState: function() {
    var ds = new ListView.DataSource({rowHasChanged: (row1, row2) => row1 !== row2});
    return {
      dataSource: ds.cloneWithRows(['row 1', 'row 2']),
    };
  },
  render: function() {
      return (
        <ListView
          dataSource={this.state.dataSource}
          renderRow={(rowData) => <Text>{rowData}</Text>}
          />
      )
    }
});
var styles = StyleSheet.create({
    container: {
        padding: 30,
        marginTop: 65,
        alignItems: "center"
    },
    heading: {
        marginBottom: 20,
        fontSize: 18,
        textAlign: "center",
        color: "#656565"
    },
    subheading: {
        color: "#cccccc"
    }
});

module.exports = SecureView;
