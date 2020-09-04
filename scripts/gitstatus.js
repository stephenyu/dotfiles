#!/usr/bin/env node

const child_process = require("child_process");

const exec = (command) => {
  return new Promise((resolve, reject) => {
    child_process.exec(command, {maxBuffer: 1024 * 500}, (error, stdout, stderr) => {
      if (error || stderr) reject(error);
      resolve(stdout);
    });
  });
};

(async () => {
  const statusMessage = [];
  try {
    const branchname = await exec('git rev-parse --abbrev-ref HEAD');
    statusMessage.push(branchname.trim());
  } catch(error) {
    process.exit(0); // git isn't viable here
  }

  try {
    const originname = await exec('git rev-parse --symbolic-full-name --abbrev-ref "@{u}"');
    statusMessage.push(originname.trim());
  } catch (err) {
    // do nothing, no origin is legit
  }

  const gitstatus = await exec('git status --porcelain -uno');
  statusMessage.push(constructGitStatus(gitstatus));

  console.log(statusMessage.join(' '));
})();

const constructGitStatus = (gitStatusOutput) => {
  // https://git-scm.com/docs/git-status#_short_format
  let updated = 0; // ' M'
  let deleted = 0; // ' D'

  gitStatusOutput.split('\n').forEach(line => {
    const indicator = line.substring(0, 2);

    switch (indicator) {
    case ' M':
      updated++;
      break;
    case '??':
      untracked++;
      break;
    case ' D':
      deleted++;
      break;
    }
  });

  let message = '';

  if (updated > 0) {
    message += `+${updated}`;
  }

  if (deleted > 0) {
    message += `x${deleted}`;
  }

  if (message.length === 0)
    message = '✓';

  return message;
};

