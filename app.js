/**
 * cPanel / CloudLinux Node.js Selector (Passenger) startup file.
 *
 * Set "Application startup file" to `app.js` in the cPanel Node.js App UI.
 * Passenger starts this file and passes PORT; it boots the Next.js
 * production server on that port. Locally use `npm start` instead.
 */
require("dotenv").config({ path: require("path").join(__dirname, ".env") });

const { createServer } = require("http");
const { parse } = require("url");
const next = require("next");

const dev = process.env.NODE_ENV === "development";
const port = Number(process.env.PORT) || 3000;

const app = next({ dev, dir: __dirname });
const handle = app.getRequestHandler();

app
  .prepare()
  .then(() => {
    createServer((req, res) => handle(req, res, parse(req.url, true))).listen(port, () => {
      console.log(`[kimsafety] ready on port ${port} (${dev ? "development" : "production"})`);
    });
  })
  .catch((err) => {
    console.error("[kimsafety] failed to start", err);
    process.exit(1);
  });
