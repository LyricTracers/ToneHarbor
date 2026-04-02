#!/usr/bin/env bash
NAME=$1
if [ "${NAME}" == "" ]
then
    NAME="ToneHarbor"
fi
echo '正在使用 Flutter 进行构建'
flutter build ios --release --no-codesign
mkdir -p Payload
mv ./build/ios/iphoneos/Runner.app Payload
zip -r -y Payload.zip Payload/Runner.app
mv Payload.zip $NAME.ipa
rm -Rf Payload