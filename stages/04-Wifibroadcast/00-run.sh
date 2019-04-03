# Do this to the WORK folder of this stage
pushd ${STAGE_WORK_DIR}

log "Removing old GIT dir"
rm -r GIT || true

mkdir -p GIT

pushd GIT

MNT_DIR="${STAGE_WORK_DIR}/mnt"

log "Download Raspi2png"
git clone https://github.com/AndrewFromMelbourne/raspi2png.git

log "Download all Open.HD Sources"
sudo git clone -b SettingsSync https://github.com/HD-Fpv/Open.HD.git
pushd Open.HD
sudo git submodule update --init
popd

#log "Download v4l2loopback"
#sudo git clone https://github.com/umlaeute/v4l2loopback.git

log "Download OpenVG"
sudo mv Open.HD/openvg/ openvg/
# sudo git clone https://github.com/RespawnDespair/openvg-font.git openvg

log "Download Mavlink router"
sudo git clone -b rock64 https://github.com/estechnical/mavlink-router.git
pushd mavlink-router
sudo git submodule update --init
#fix missing pymavlink
pushd modules/mavlink
sudo git clone --recurse-submodules  https://github.com/ArduPilot/pymavlink.git

popd
popd

log "Download cmavnode"
sudo git clone https://github.com/MonashUAS/cmavnode.git
pushd cmavnode
sudo git submodule update --init
popd

log "Download EZWFB - Base"
# sudo git clone https://github.com/user1321/wifibroadcast-base.git
sudo mv Open.HD/wifibroadcast-base/ wifibroadcast-base/
sudo cp -r Open.HD/mavlink/ wifibroadcast-base/mavlink/

log "Download EZWFB - OSD"
# sudo git clone https://github.com/user1321/wifibroadcast-osd-orig wifibroadcast-osd
sudo mv Open.HD/wifibroadcast-osd/ wifibroadcast-osd/
sudo cp -r Open.HD/mavlink/ wifibroadcast-osd/mavlink/

log "Download EZWFB - RC"
# sudo git clone https://github.com/user1321/wifibroadcast-rc-orig.git wifibroadcast-rc
sudo mv Open.HD/wifibroadcast-rc/ wifibroadcast-rc/
# sudo git clone -b user1321-5MHzAth9k https://github.com/user1321/wifibroadcast-rc-orig.git wifibroadcast-rc-Ath9k
sudo mv Open.HD/wifibroadcast-rc-Ath9k/ wifibroadcast-rc-Ath9k/

log "Download EZWFB - Status"
# sudo git clone https://github.com/RespawnDespair/wifibroadcast-status.git
sudo mv Open.HD/wifibroadcast-status/ wifibroadcast-status/

log "Download EZWFB - Scripts"
# sudo git clone -b user1321-5MhzAth9k https://github.com/user1321/wifibroadcast-scripts.git
sudo mv Open.HD/wifibroadcast-scripts/ wifibroadcast-scripts/

log "Download EZWFB - Misc"
# sudo git clone https://github.com/RespawnDespair/wifibroadcast-misc.git
sudo mv Open.HD/wifibroadcast-misc/ wifibroadcast-misc/

log "Download EZWFB - hello_video"
# sudo git clone https://github.com/RespawnDespair/wifibroadcast-hello_video.git
sudo mv Open.HD/wifibroadcast-hello_video/ wifibroadcast-hello_video/

log "Download EZWFB - Splash"
# sudo git clone https://github.com/RespawnDespair/wifibroadcast-splash.git
sudo mv Open.HD/wifibroadcast-splash/ wifibroadcast-splash/

log "Download FLIR one"
sudo git clone https://github.com/fnoop/flirone-v4l2.git

log "Download RemoteSettings"
# sudo git clone -b user1321-5MhzAth9k https://github.com/user1321/RemoteSettings
sudo mv Open.HD/RemoteSettings/ RemoteSettings/

log "Download cameracontrol"
# sudo git clone https://github.com/user1321/cameracontrol
sudo mv Open.HD/cameracontrol/ cameracontrol/

log "Download rc-encrypted"
# sudo git clone https://github.com/user1321/wifibroadcast-rc-encrypted
sudo mv Open.HD/wifibroadcast-rc-encrypted/ wifibroadcast-rc-encrypted/

log "Download JoystickIn"
# sudo git clone https://github.com/user1321/JoystickIn
sudo mv Open.HD/JoystickIn/ JoystickIn/

sudo rm -rf Open.HD

#return
popd
popd
