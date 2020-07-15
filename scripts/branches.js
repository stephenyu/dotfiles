#!/usr/bin/env node

const COLORS = {
  reset: "\x1b[0m",
  bright: "\x1b[1m",
  dim: "\x1b[2m",
  underscore: "\x1b[4m",
  blink: "\x1b[5m",
  reverse: "\x1b[7m",
  hidden: "\x1b[8m",
  fgblack: "\x1b[30m",
  fgred: "\x1b[31m",
  fggreen: "\x1b[32m",
  fgyellow: "\x1b[33m",
  fgblue: "\x1b[34m",
  fgmagenta: "\x1b[35m",
  fgcyan: "\x1b[36m",
  fgwhite: "\x1b[37m",
}

const child_process = require("child_process");

const FILTER_BRANCHES = ['master', 'green'];

const exec = (command) => new Promise((resolve, reject) => {
    child_process.exec(command, (error, stdout, stderr) => {
      if (error || stderr) reject(error);
      resolve(stdout);
    });
  });

function displayTable(branches) {
    branches.forEach((branchName, index) => console.log(`${COLORS.fgwhite}${index + 1}\t${COLORS.fgblue}${branchName}${COLORS.reset}`));
}

function severalBranchOptions(parameter, potentialBranches) {
    console.log(`${COLORS.fggreen}Filtering: ${COLORS.fgwhite}${parameter}${COLORS.reset}`)
    displayTable(potentialBranches)
}

async function switchToBranch(branchName) {
  console.log(`${COLORS.fggreen}Switching to: ${COLORS.fgwhite}${branchName}${COLORS.reset}`);
  return exec(`git checkout ${branchName}`);
}

(async () => {
  try {
    const cmdOutput = await exec('git branch -v --sort=-committerdate');
    const branches = cmdOutput.split('\n')
          .filter(line => {
              if (FILTER_BRANCHES.some(notAllowedBranchName => line.includes(notAllowedBranchName))) {
                  return false;
              }

              if (line.length === 0) {
                  return false
              }

              if (line.startsWith('*')) {
                  return false
              }

              return true
          })
          .map(line => line.match(/\s*([a-zA-Z0-9-]*)\s/)[1]);

  const [,, ...arguments] = process.argv;

  if (arguments.length === 0) {
      displayTable(branches);
      process.exit(1);
  } else if (arguments.length >= 1) {
      const parameter = arguments[0];

      if (isNaN(parameter) === false) {
        await switchToBranch(branches[(~~parameter) - 1]);
        process.exit(1);
      }

      const potentialBranches = branches.filter(branchName => branchName.includes(parameter));

      if (potentialBranches.length > 1) {
        if (arguments[1] !== undefined) {
          const possibleIndex = arguments[1];

          if (isNaN(possibleIndex) === false) {
            await switchToBranch(potentialBranches[(~~possibleIndex) - 1]);
            process.exit(1);
          }
        }

        severalBranchOptions(parameter, potentialBranches)
        process.exit(1);
      } else {
        await switchToBranch(potentialBranches.pop());
        process.exit(1);
      }
  }

  } catch(error) {
    process.exit(0); // git isn't viable here
  }
})();
