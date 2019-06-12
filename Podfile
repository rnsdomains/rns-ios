# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'
use_frameworks!
def framework_pods
  pod 'Web3'
  pod 'Web3/ContractABI'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Web3/PromiseKit'
end

target 'rns-ios' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for rns-ios
  pod 'Web3'
  pod 'Web3/ContractABI'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Web3/PromiseKit'
  
target 'rns-iosTests' do
  inherit! :complete
  # Pods for testing

end

post_install do |installer|
  # Downgrade Swift language version to 4.0 for Pods that don't support Swift 4.2
  installer.pods_project.targets.each do |target|
    if ['RxSwift', 'Web3'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
end

end
