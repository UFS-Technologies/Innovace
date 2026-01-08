const socketio = require('socket.io');
const db = require('./dbconnection.js');

class SocketManager {
  constructor() {
    if (SocketManager.instance) return SocketManager.instance;

    this.io = null;
    this.connectedUsers = new Map();
    SocketManager.instance = this;
  }

  initialize(server) {
    this.io = socketio(server, {
      cors: {
        origin: '*',
        methods: ['GET', 'POST']
      }
    });

    this.io.on('connection', (socket) => {
      console.log(`🟢 New client connected: ${socket.id}`);

      socket.on('test', (msg) => {
        console.log(`🟡 Test event received: ${msg}`);
      });

      socket.on('disconnect', () => {
        console.log(`🔴 Client disconnected: ${socket.id}`);
      });

      socket.on('register_user', async (userId) => {
        const room = `user-${userId}`;
        socket.join(room);
        console.log(`🟠 User ${userId} joined room ${room}`);

        const query = `
          SELECT * FROM notifications
          WHERE DeleteStatus = 0
          ORDER BY Created_At DESC
        `;

        try {
          // Use promise query from pool
          const [results] = await db.promise().query(query);

          const transformedResults = results.map(row => {
            const { Task_Master_Id, ...rest } = row;
            return {
              ...rest,
              Master_Id: Task_Master_Id
            };
          });

          socket.emit('all_notification', transformedResults);
          console.log(`🟢 Sent ${results.length} notifications to user ${userId}`);
        } catch (err) {
          console.error(`❌ Error fetching notifications for user ${userId}:`, err);
        }
      });
    });
  }

  getIO() {
    if (!this.io) {
      throw new Error('Socket.io is not initialized yet!');
    }
    return this.io;
  }
}

module.exports = new SocketManager();
