#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const os = require('os');

const configDir = path.join(os.homedir(), '.ai-config');

// Create config directory
if (!fs.existsSync(configDir)) {
  fs.mkdirSync(configDir, { recursive: true });
}

console.log('');
console.log('\x1b[32m[OK]\x1b[0m AI-Link installed!');
console.log('');
console.log('Run \x1b[36mai-link\x1b[0m to scan and link all your AI tools');
console.log('');
