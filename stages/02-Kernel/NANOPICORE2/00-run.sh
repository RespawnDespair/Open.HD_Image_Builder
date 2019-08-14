set -e

# Do this to the WORK folder of this stage
pushd ${STAGE_WORK_DIR}

log "Remove previous Kernel"
rm -r linux || true

log "Download the NanoPi Kernel"
git clone https://github.com/friendlyarm/linux.git -b sunxi-4.14.y --depth 1

#return 
popd
