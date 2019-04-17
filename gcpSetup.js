var fs=require(‘fs’);
fs.writeFile(process.env.GCP_KEY_FILE, process.env.GOOGLE_APPLICATION_CREDENTIALS, (err) => {});
