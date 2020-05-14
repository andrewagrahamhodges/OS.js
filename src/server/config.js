const path = require('path');
const root = path.resolve(__dirname, '../../');

{
  xterm: {
    ssh: {
      // Custom username
      username: 'supervisor',
      // Custom hostname
      hostname: 'localhost',

      // Custom port
      args: '-p 22'
    }
  }
}

module.exports = {
  root,
  port: 8000,
  public: path.resolve(root, 'dist')
};
