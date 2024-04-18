# Uncomment the next line to define a global platform for your project
platform :ios, ’10.0’
target 'HelloLua-mobile' do
  # Comment the next line if you don't want to use dynamic frameworks
  gem install cocoapods
  pod repo update
  pod 'Pods_HelloLua_mobile'
  use_frameworks!
  project 'frameworks/runtime-src/proj.ios_mac/HelloLua.xcodeproj'
end