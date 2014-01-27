function xo {
  XCWORKSPACE=`find . -maxdepth 1 -type d -name "*.xcworkspace" | grep -v "project.xcworkspace" | tr '/' '\n' | grep ".xcworkspace" | head -n1`
  XCODEPROJ=`find . -maxdepth 1 -type d -name "*.xcodeproj" | tr '/' '\n' | grep ".xcodeproj" | head -n1`
  if [ -n "${XCWORKSPACE}"  ]; then
    open "`find . -type d -name "${XCWORKSPACE}" | cut -c3- | sed 's/ /\\ /g'`"
  elif [ -n "${XCODEPROJ}" ]; then
    open "`find . -type d -name "${XCODEPROJ}" | cut -c3- | sed 's/ /\\ /g'`"
  fi
}

function xsort {
  if [ ! -f "./sort.pl" ]; then
    echo "error: Unable to find sort.pl xcode project sorting script."
    echo
    exit -1
  fi

  XCODEPROJ=`find . -maxdepth 1 -type d -name "*.xcodeproj" | tr '/' '\n' | grep ".xcodeproj" | head -n1`
  if [ -n "${XCODEPROJ}" ]; then
    echo -n "Sorting xcode project: "
    perl sort.pl ${XCODEPROJ}/project.pbxproj
    echo "finished."
  fi
}

alias cisetup='ant -f "${USTWO_BUILDTOOLS_HOME}"/iOS/build.xml buildtools-import'

alias symbolicate="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKit.framework/Versions/A/Resources/symbolicatecrash -v"
