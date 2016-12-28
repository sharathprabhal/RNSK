/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  requireNativeComponent,
  Dimensions,
} from 'react-native';

const GameView = requireNativeComponent('RCTGame', null);

export default class RNSK extends Component {

  constructor(props) {
    super(props);
    this.state = {
      input: 23,
      lastScore: 0,
      inGame: false,
    };
  }

  startGame() {
    // render game screen
    this.setState({
      inGame: true,
    })
  }

  onEnd(e) {
    this.setState({
      lastScore: e.nativeEvent.score,
      inGame: false,
    });
  }
  
  render() {
    if (this.state.inGame) {
      return (
        <GameView 
          input={this.state.input}
          onEnd={this.onEnd.bind(this)}
          style={{
            width: Dimensions.get('window').width,
            height: Dimensions.get('window').height,
          }}
        />
      );
    }
    return (
      <View style={styles.container}>
        <Text style={styles.text}>
          Welcome to React Native SpriteKit demo!
        </Text>
        <Text style={styles.text}>
          Last Score: {this.state.lastScore}
        </Text>
        <TouchableOpacity onPress={this.startGame.bind(this)}>
          <Text style={styles.text}>
            START GAME
          </Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  text: {
    padding: 10,
    fontSize: 24,
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RNSK', () => RNSK);
