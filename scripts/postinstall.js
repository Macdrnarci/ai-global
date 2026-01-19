#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const os = require("os");

const configDir = path.join(os.homedir(), ".ai-global");

// Create config directory
if (!fs.existsSync(configDir)) {
  fs.mkdirSync(configDir, { recursive: true });
}

console.log("");
console.log("\x1b[32m[OK]\x1b[0m AI Global installed!");
console.log("");
console.log("Run \x1b[36mai-global\x1b[0m to scan and link all your AI tools");
console.log("");
