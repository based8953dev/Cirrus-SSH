#!/bin/bash

#retards!

git clone  https://github.com/akhilnarang/scripts.git && cd scripts && bash setup/android_build_env.sh && cd ..
mkdir awaken
cd awaken
sudo apt-get install repo -y
repo init -u https://github.com/Project-Awaken/android_manifest -b 12
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
git clone https://github.com/rxhulkxnt44/device_xiaomi_vince -b oem-radio device/xiaomi/vince
git clone https://github.com/rxhulkxnt44/vendor_xiaomi_vince -b arrow-12.0-staging vendor/xiaomi/vince
rm -rf hardware/qcom-caf/msm8996
mkdir hardware/qcom-caf/msm8996
cd hardware/qcom-caf/msm8996
git clone -b twelve https://github.com/PixelExperience/hardware_qcom-caf_msm8996-r_audio.git audio
git clone -b twelve https://github.com/PixelExperience/hardware_qcom-caf_msm8996-r_display.git display
git clone -b twelve https://github.com/PixelExperience/hardware_qcom-caf_msm8996-r_media.git media
cd ../../..
git clone -b darky https://github.com/Blacksuan19/kernel_dark_ages_vince.git kernel/xiaomi/vince 
git clone -b main https://github.com/rk134/proton-clang.git prebuilts/clang/host/linux-x86/clang-proton --depth 1
cd build
chmod +x envsetup.sh
cd ..
. build/envsetup.sh
lunch awaken_vince-userdebug
make bacon


