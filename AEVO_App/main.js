const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const { exec } = require('child_process');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1200,
    height: 800,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false
    },
    icon: path.join(__dirname, 'icon.png')
  });

  mainWindow.loadFile('index.html');
  mainWindow.setTitle('AEVO Prüfungssystem 2025');
}

app.whenReady().then(createWindow);

// Event-Handler
ipcMain.on('open-strategie', () => {
  exec('feh -F ~/Bilder/AEVO_Unterweisung_Active_Directory_Nutzer_anlegen/AEVO_Slideshow_Strategie_Lerntyp_JPG/ &');
});

ipcMain.on('open-passive', () => {
  exec('feh -F ~/Bilder/AEVO_Unterweisung_Active_Directory_Nutzer_anlegen/AEVO_Slideshow_Lerntyp_Rebuild_JPG/ &');
});

ipcMain.on('play-video', (event, filename) => {
  exec(`vlc ~/Bilder/AEVO_Unterweisung_Active_Directory_Nutzer_anlegen/AEVO_Export/${filename} &`);
});

ipcMain.on('open-pdf', (event, filename) => {
  exec(`evince ~/Bilder/AEVO_Unterweisung_Active_Directory_Nutzer_anlegen/AEVO_Export/${filename} &`);
});
