Pod::Spec.new do |s|
  s.name = "MediaMetaManager"
  s.version = "0.1.3"
  s.summary = "MediaMetaManager."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"Silence"=>"374619540@qq.com"}
  s.homepage = "https://github.com/silence0201/MediaMetaManager"
  s.description = "An easy get media meta data"
  s.frameworks = "AVFoundation"
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.vendored_framework   = 'ios/MediaMetaManager.framework'
end
