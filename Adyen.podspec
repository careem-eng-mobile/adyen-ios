version = `agvtool vers -terse`

Pod::Spec.new do |s|
  s.name = 'Adyen-1.16'
  s.version = version
  s.summary = "Adyen SDK for iOS"
  s.description = <<-DESC
    With Adyen SDK you can dynamically list all relevant payment methods for a specific transaction, so your shoppers can always pay with the method of their choice. The methods are listed based on the shopper's country, the transaction currency and amount.
  DESC

  s.homepage = 'https://adyen.com'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Adyen' => 'support@adyen.com' }
  s.source = { :git => 'https://github.com/Adyen/adyen-ios.git', :tag => "#{s.version}" }
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.frameworks = 'Foundation'

  s.default_subspecs = 'Core', 'Cards', 'Ideal', 'SEPADirectDebit', 'UI'

  s.subspec 'Core' do |plugin|
    plugin.source_files = 'Adyen/Core/**/*.swift'
  end

  # Payment Methods
  s.subspec 'ApplePay' do |plugin|
    plugin.source_files = 'Adyen/Plugins/ApplePay/**/*.swift'
    plugin.dependency 'Adyen-1.16/Core'
    plugin.dependency 'Adyen-1.16/CoreUI'
  end

  s.subspec 'Cards' do |plugin|
    plugin.dependency 'Adyen-1.16/Core'
    plugin.dependency 'Adyen-1.16/CoreUI'
    plugin.dependency 'AdyenCSE', '~> 1.1'
    plugin.source_files = 'Adyen/Plugins/Cards/**/*.swift'
    plugin.resource_bundles = {
        'Cards' => [
            'Adyen/Plugins/Cards/**/*.xib'
        ]
    }
  end

  s.subspec 'Ideal' do |plugin|
    plugin.source_files = 'Adyen/Plugins/Ideal/**/*.swift'
    plugin.dependency 'Adyen-1.16/CoreUI'
    plugin.dependency 'Adyen-1.16/Core'
  end

  s.subspec 'SEPADirectDebit' do |plugin|
    plugin.source_files = 'Adyen/Plugins/SEPADirectDebit/**/*.swift'
    plugin.dependency 'Adyen-1.16/Core'
    plugin.dependency 'Adyen-1.16/CoreUI'
  end

  s.subspec 'MOLPay' do |plugin|
    plugin.source_files = 'Adyen/Plugins/MOLPay/**/*.swift'
    plugin.dependency 'Adyen-1.16/Core'
    plugin.dependency 'Adyen-1.16/CoreUI'
  end

  # Internals
  s.subspec 'UI' do |plugin|
    plugin.source_files = 'Adyen/UI/**/*.swift'
    plugin.dependency 'Adyen-1.16/Core'
    plugin.dependency 'Adyen-1.16/CoreUI'
  end

  s.subspec 'CoreUI' do |plugin|
    plugin.source_files = 'Adyen/CoreUI/**/*.swift'
    plugin.resource_bundles = {
        'CoreUI' => [
            'Adyen/CoreUI/Assets/Media.xcassets',
            'Adyen/CoreUI/Assets/*.lproj/*.strings'
        ]
    }
    plugin.dependency 'Adyen/Core'
  end
end
