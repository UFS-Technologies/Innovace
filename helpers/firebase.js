const axios = require('axios');
const jwt = require('jsonwebtoken');
const serviceAccount = require("../solaris-app-b2973-firebase-adminsdk-3f6rq-23b2415a19.json");

const PROJECT_ID = 'solaris-app-b2973';  
const BASE_URL = `https://fcm.googleapis.com/v1/projects/${PROJECT_ID}/messages:send`;

const sendNotifToTopicRestAPI = async (topic, title, body, data, retries = 3, delayMs = 1000) => {
  const getAccessToken = async () => {
    try {
      const response = await axios.post(
        'https://oauth2.googleapis.com/token',
        {
          grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
          assertion: generateJWT()
        }
      );
      return response.data.access_token;
    } catch (error) {
      console.error('Error getting access token:', error.message);
      throw error;
    }
  };

  const sendWithRetry = async (attempt = 1) => {
    try {
      const accessToken = await getAccessToken();

      const message = {
        message: {
          topic, 
          notification: { title, body }, 
          data, 
          android: {
            priority: 'high',
            ttl: '3600s', 
            notification: {
              click_action: 'FLUTTER_NOTIFICATION_CLICK'
            }
          },
          apns: {
            headers: {
              'apns-priority': '10',
              'apns-push-type': 'alert'
            },
            payload: {
              aps: {
                alert: { title, body }, 
                sound: 'default',
                badge: 1
              }
            }
          }
        }
      };

      const response = await axios.post(
        BASE_URL,
        message,
        {
          headers: {
            'Authorization': `Bearer ${accessToken}`,
            'Content-Type': 'application/json',
          }
        }
      );

      console.log(`Notification sent successfully to topic: ${topic}`, response.data);
      return response.data; // Ensure response is returned here
    } catch (error) {
      console.error(`Attempt ${attempt} failed for topic ${topic}. Error:`, error.message);

      if (attempt < retries) {
        console.warn(`Retrying in ${delayMs * attempt}ms...`);
        await new Promise(resolve => setTimeout(resolve, delayMs * attempt));
        return sendWithRetry(attempt + 1);
      }

      // Throw error explicitly after retries are exhausted
      throw new Error(
        `Failed to send notification to topic ${topic} after ${retries} attempts: ${error.message}`
      );
    }
  };

  return sendWithRetry();
};


const generateJWT = () => {
  const now = Math.floor(Date.now() / 1000);

  const payload = {
    iss: serviceAccount.client_email,
    sub: serviceAccount.client_email,
    aud: 'https://oauth2.googleapis.com/token',
    iat: now,
    exp: now + 3600, 
    scope: 'https://www.googleapis.com/auth/firebase.messaging'
  };

  return jwt.sign(
    payload,
    serviceAccount.private_key,
    { algorithm: 'RS256' }
  );
};

module.exports = {
  sendNotifToTopicRestAPI
};
