Pod::Spec.new do |s|
  s.name         = "MediaMetaManager"
  s.version      = "0.1.2"
  s.summary      = "MediaMetaManager."
  s.description  = <<-DESC
  						An easy get media meta data
                   DESC

  s.homepage     = "https://github.com/silence0201/MediaMetaManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Silence" => "374619540@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/silence0201/MediaMetaManager.git", :tag => "0.1.2" }
  s.source_files  = "MetaManager", "MetaManager/**/*.{h,m}"
  s.exclude_files = "MetaManager/Exclude"
  s.framework  = "AVFoundation"
  s.requires_arc = true
end
