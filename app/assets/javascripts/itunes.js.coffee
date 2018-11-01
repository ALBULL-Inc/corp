_merchantSettings = _merchantSettings or []
_merchantSettings.push ["AT", "11loVz"]
(->
  autolink = document.createElement("script")
  autolink.type = "text/javascript"
  autolink.async = true
  autolink.src = "https://autolinkmaker.itunes.apple.com/js/itunes_autolinkmaker.js"
  s = document.getElementsByTagName("script")[0]
  s.parentNode.insertBefore autolink, s
)()
