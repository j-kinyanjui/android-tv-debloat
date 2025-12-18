#!/bin/bash

# https://gist.github.com/atais/f3f4544bb6685c4c2e8b0335f878bb3f
# List of packages to uninstall
packages=(
  "com.google.android.syncadapters.calendar"
  "com.google.android.syncadapters.contacts"
  "com.android.providers.contacts"
  "com.android.providers.calendar"
  #"com.google.android.inputmethod.latin"
  "com.android.providers.userdictionary"
  "com.google.android.tvrecommendations"
  "com.google.android.youtube.tvmusic"
  "com.google.android.marvin.talkback"
  "com.android.companiondevicemanager"
  "com.android.settings.intelligence"
  "com.google.android.speech.pumpkin"
  "com.google.android.partnersetup"
  "com.google.android.play.games"
  "com.google.android.youtube.tv"
  "com.google.android.feedback"
  "com.google.android.videos"
  "com.android.printspooler"
  "com.android.dreams.basic"
  "com.netflix.ninja"
  "com.sony.dtv.sonyselect.overlay"
  "com.sony.dtv.sonyselect"
  "com.amazon.amazonvideo.livingroom"
  "com.sony.dtv.osat.music"
  "com.sony.dtv.discovery"
  "com.sony.dtv.youview"
  "com.sony.dtv.demosupport"
  "com.sony.dtv.demomode"
  "com.sony.dtv.b2b.hotelmode"
  "com.sony.dtv.smartmediaapp"
  "com.sony.dtv.promos"
  "com.sony.dtv.smarthelp"
  "com.sony.dtv.smarthomesettings"
  "com.sony.dtv.multiscreendemo"
  "com.sony.dtv.browser.ceb"
  "com.sony.dtv.webapi.core"
  "com.sony.dtv.browser.webappruntime"
  "com.sony.dtv.browser.webappservice"
  "android.autoinstalls.config.sony.bravia"
  "tv.samba.ssm"
  "com.sony.dtv.interactivetvutil.output"
  "com.sony.dtv.interactivetvutil"
  "com.vewd.core.integration.dia"
  "com.youview.tv.servicehost"
  "com.sony.dtv.imanual"
  "com.sony.dtv.hbbtvlauncher"
  "com.sony.dtv.customersupport"
  "com.google.android.tv.bugreportsender"
  "com.google.android.tts"
  "com.android.htmlviewer"
  "com.google.android.tv.remote.service"
  "com.google.android.katniss"
  "com.sony.dtv.ime.chww"
)

# Loop through each package and uninstall
for package in "${packages[@]}"; do
    echo "[INFO] Uninstalling $package..."
    adb -s <tv-ip> shell pm uninstall --user 0 $package
done

# Performance tweaks: Disable window and transition animations
echo "[INFO] Disabling animations for better performance..."

adb -s <tv-ip> shell settings put global window_animation_scale 0
adb -s <tv-ip> shell settings put global transition_animation_scale 0
adb -s <tv-ip> shell settings put global animator_duration_scale 0

echo "[INFO] Done ✅."

