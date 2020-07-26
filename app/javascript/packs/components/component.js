export default class Component {
  constructor(container) {
    this.container = container;
  }

  render = options => {
    console.log('component render');
  }

  componentWillMount = options => {
    console.log('componentWillMount component');
  }

  componentDidMount = options => {
    console.log('componentDidMount component');
  }
}
