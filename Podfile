# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'HelloWorld' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for HelloWorld
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'MMKV'
  pod 'CryptoSwift'
  pod 'Moya'
  pod 'SwiftGen'
  pod 'SDWebImage'
  pod 'IQKeyboardManagerSwift'
end

post_install do |installer|
  installer.generated_projects.each do |project|
      project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
          end
      end
  end
end