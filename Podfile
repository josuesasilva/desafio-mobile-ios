platform :ios, '9.0'

def shared_pods
  pod 'RxSwift', '~> 3.0'
  pod 'RxCocoa', '~> 3.0'
  pod 'Alamofire', '~> 4.4'
  pod 'RxAlamofire'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'Kingfisher', '~> 3.0'
end

target 'desafio-mobile-ios' do
  use_frameworks!
  shared_pods
end

target 'desafio-mobile-iosTests' do
  use_frameworks!
  shared_pods
  pod 'Mockingjay'
end
