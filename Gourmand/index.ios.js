

"use strict";

var React = require("react-native");

var {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    NavigatorIOS,
} = React;

var Login = require("./App/Components/Login");

var Gourmand = React.createClass({
    render: function() {
        return (
            <NavigatorIOS
                style={styles.navigationContainer}
                initialRoute={{
                title: "Login",
                component: Login,
            }} />
        );
    }
});

var styles = StyleSheet.create({
    navigationContainer: {
        flex: 1
    }
});

AppRegistry.registerComponent("Gourmand", () => Gourmand);
