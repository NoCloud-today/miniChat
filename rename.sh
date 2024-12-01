#!/usr/bin/env bash

camelNameOld=$(cat miniChat/config.env | cut -d ' ' -f 1)
lowerNameOld=$(cat miniChat/config.env | cut -d ' ' -f 2)
echo $lowerNameOld
echo $camelNameOld
camelNameNew=$(cat miniChat/config.env | cut -d ' ' -f 3)
lowerNameNew=$(cat miniChat/config.env | cut -d ' ' -f 4)
echo $lowerNameNew
echo $camelNameNew

#---Change in app_config
sed -i "0,/$camelNameOld/s/$camelNameOld/$camelNameNew/" fluffychat/lib/config/app_config.dart

#---Change in web
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/web/index.html

#---Change in android
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/android/app/src/main/AndroidManifest.xml

#---Change in ios (also change in description)
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/ios/Runner/Info.plist
sed -i "s/>$lowerNameOld</>$lowerNameNew</g" fluffychat/ios/Runner/Info.plist

#---Change in linux
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/linux/my_application.cc
sed -i "s/\"$lowerNameOld\"/\"$lowerNameNew\"/g" fluffychat/linux/CMakeLists.txt

#---Change in windows
sed -i "s/\"$lowerNameOld\"/\"$lowerNameNew\"/g" fluffychat/windows/CMakeLists.txt
sed -i "s/$camelNameOld/$camelNameNew/g" fluffychat/windows/runner/main.cpp

#---Change in macOS
sed -i "s/= $camelNameOld/= $camelNameNew/g" fluffychat/macos/Runner/Configs/AppInfo.xcconfig

#---Change assets
cp -f miniChat/main_assets/login_wallpaper.png fluffychat/assets/login_wallpaper.png
cp -f miniChat/main_assets/logo.png fluffychat/assets/logo.png
cp -f miniChat/main_assets/banner_transparent.png fluffychat/assets/banner.png #transparent banner in all ways
cp -f miniChat/main_assets/logo_transparent.png fluffychat/assets/logo_transparent.png
cp -f miniChat/main_assets/banner_transparent.png fluffychat/assets/banner_transparent.png
cp -f miniChat/main_assets/favicon.png fluffychat/assets/favicon.png
cp -f miniChat/main_assets/logo.svg fluffychat/assets/logo.svg
cp -f miniChat/main_assets/info-logo.png fluffychat/assets/info-logo.png

#---Change icons
#---web
cp -f miniChat/icons/web/Icon-512.png fluffychat/web/icons/Icon-512.png
cp -f miniChat/icons/web/Icon-512.png fluffychat/web/icons/Icon-192.png
for i in {1..4}; do
    cp -f miniChat/icons/web/logo.png fluffychat/web/splash/img/dark-$i\x.png
    cp -f miniChat/icons/web/logo.png fluffychat/web/splash/img/light-$i\x.png
done
cp -f miniChat/icons/web/favicon.png fluffychat/web/favicon.png