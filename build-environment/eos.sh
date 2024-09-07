#!/bin/sh
sudo apt install git git-lfs
# To debug SELinux (audit2allow tool)
sudo apt install policycoreutils-python-utils

git clone https://github.com/metterschlg/scripts

# Setup build environment
cd scripts
./build_environment.sh
# Initialize /e/os 1-t environment
cd ~/android
mkdir Eos
cd Eos
repo init -u https://gitlab.e.foundation/e/os/android.git -b v1-t --git-lfs
git lfs install
cd .repo
git clone https://github.com/eduyl/local_manifests
cd ..
repo sync --force-sync
git clone https://github.com/eduyl/Lineageos_patches.git -b e/os ~/patches-lineage-20.0
cp -r ~/patches-lineage-20.0/apply.sh ~/android/Eos
chmod +x apply.sh
./apply.sh

#Start Building
source build/envsetup.ah
#breakfast
breakfast gts210ltexx
#start build
brunch gts210ltexx
