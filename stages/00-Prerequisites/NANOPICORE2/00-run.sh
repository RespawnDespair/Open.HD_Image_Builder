log "Checking prerequisites"

pushd "${STAGE_WORK_DIR}"

if [ ! -d ~/nanopitools ]; then
    log "Download NanoPi Tools from Google Drive"
    ../../scripts/gdown.pl https://drive.google.com/open?id=13gN-ChrEl3MCzfCF-m2JRhhjYwCj8wyE ./NanoPi-Duo2-20190522.7z

    log "Extract NanoPi Tools"
    mkdir -p ~/nanopitools
    7z x "NanoPi-Duo2-20190522.7z" 
    mv ./H3 ~/nanopitools
    
    log "Install the NanoPi Tools"
    mkdir -p /opt/FriendlyARM/toolchain
    tar xf ~/nanopitools/H3/NanoPi-Duo2/toolchain/arm-cortexa9-linux-gnueabihf-4.9.3-20160512.tar.xz -C /opt/FriendlyARM/toolchain/
    echo "PATH=\$PATH:/opt/FriendlyARM/toolchain/4.9.3/bin" >> ~/.bashrc
    source ~/.bashrc
fi

popd

