const path = require('path');
const root = path.resolve(__dirname, '../../');

{
  xterm: {
    ssh: {
      // Custom hostname
      hostname: 'localhost',
    }
  }
}

module.exports = {
  root,
  port: 8000,
  public: path.resolve(root, 'dist')
};
