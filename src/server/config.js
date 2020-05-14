const path = require('path');
const root = path.resolve(__dirname, '../../');
{
  xterm: {
    // You can also set this as a string to force a username
    username: 'supervisor'
  }
}

module.exports = {
  root,
  port: 8000,
  public: path.resolve(root, 'dist')
};
