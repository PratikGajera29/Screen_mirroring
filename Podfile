# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def app_pods
    pod 'ConnectSDK/Core', :git => 'https://github.com/ConnectSDK/Connect-SDK-iOS.git', :branch => 'master', :submodules => true
end

target 'ScreenMirroring' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  app_pods
  # Pods for ScreenMirroring

  target 'ScreenMirroringTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ScreenMirroringUITests' do
    # Pods for testing
  end

end
