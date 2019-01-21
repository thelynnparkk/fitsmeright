# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'



# Remove pods project warning
# Method1: inhibit_all_warnings -> YES
# Method2: add inhibit_all_warnings! in podfile
inhibit_all_warnings!



def ui_pods
# note
pod 'NVActivityIndicatorView', '~> 4.4.0'
# note
#pod 'Toast-Swift', '~> 4.0.0'
# note
pod 'PopupDialog', '~> 0.9'
# note
pod 'SkeletonView', '~> 1.4'
# note
pod 'RAMAnimatedTabBarController', '~> 4.0.1'
# note
pod 'SnapKit', '~> 4.2.0'
# note
pod 'SkyFloatingLabelTextField', '~> 3.6.0'
# note
pod 'IQKeyboardManagerSwift', '~> 6.0'
# note
pod 'RevealingSplashView', '~> 0.6.0'
end




def other_pods
# note
pod 'CodableFirebase', '~> 0.2.1'
# note
pod 'SwiftDate', '~> 5.0.13'
# note
pod 'Firebase/Core'
# note
pod 'Firebase/Firestore'
# note
pod 'Firebase/Storage'
# note
pod 'CodableFirebase', '~> 0.2.1'
# note
pod 'SwiftDate', '~> 5.0.13'
# > 4.6.0
pod 'SwifterSwift', '~> 4.6.0'
end



def fitsmeright_pods
# Comment the next line if you're not using Swift and don't want to use 
use_frameworks!
# Pods for fitsmeright
ui_pods
other_pods
end




target 'fitsmeright' do
fitsmeright_pods
swift_4_0_pods = ['SkeletonView']
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if swift_4_0_pods.include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
end

  target 'fitsmerightTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'fitsmerightUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
