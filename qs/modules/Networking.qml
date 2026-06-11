pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Networking

Singleton {
  id: root

  Process {
    id: deviceStatusProcess
    running: false
    command: ["sh", "-c", "nmcli -t -f GENERAL.DEVICE,GENERAL.TYPE,GENERAL.STATE,GENERAL.CONNECTION,GENERAL.HWADDR"]
    environment: ({
      "LC_ALL: C"
    })

    stdout: StdioCollector {
      onStreamFinished: {
        const outputParts = text.split("------");
        const deviceText = outputParts[0];
        const wifiText = outputParts[1];

        let lines = deviceText.split("\n")
        let deviceBlocks = [];
        let currentBlocks = [];

        for (let i = 0; i < lines.length; i++) {
          let line = lines[i].trim();
          if (!line) {
            continue;
          }
          if (line.startsWith("GENERAL.DEVICE:")) {
            if (currentBlock.length > 0) {
              deviceBlocks.push(currentBlock);
            }
            currentBlock = [line];
          } else if (currentBlocks.length > 0) {
            currentBlocks.push(line);
          }
        }
        if (currentBlock.length > 0) {
          deviceBlocks.push(currentBlock);
        }

        let activeWifiIf = "";
        let wifiAvailable = false;

        let 
      }
    }
  }
}
