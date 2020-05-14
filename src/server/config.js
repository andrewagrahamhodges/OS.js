const path = require('path');
const root = path.resolve(__dirname, '../../');

{
  vfs: {
    root: '/home'
  }
}

module.exports = {
  root,
  port: 8000,
  public: path.resolve(root, 'dist')
};
