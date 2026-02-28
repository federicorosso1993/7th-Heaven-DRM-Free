$downloadUrl = "https://github.com/federicorosso1993/7th-Heaven-DRM-Free/releases/latest"

if ($env:_IS_BUILD_CANARY -eq "true") {
  $downloadUrl = "https://github.com/federicorosso1993/7th-Heaven-DRM-Free/releases/tag/canary"
}

# Initial template from https://discohook.org/
$discordPost = @"
{
  "username": "7th Heaven",
  "avatar_url": "https://github.com/federicorosso1993/7th-Heaven-DRM-Free/raw/master/.logo/app.png",
  "content": "Release **${env:_RELEASE_VERSION}** has just been published!\n\nDownload Url: ${downloadUrl}\n\nIf you find something broken or unexpected, feel free to check existing ones first here https://github.com/federicorosso1993/7th-Heaven-DRM-Free/issues.\nIf non existing, then report your issue here https://github.com/federicorosso1993/7th-Heaven-DRM-Free/issues/new.\n\nThank you for using 7th Heaven!",
  "embeds": [
    {
      "title": "FAQ",
      "description": "Having issues? Feel free to check this FAQ page: https://forums.qhimm.com/index.php?topic=21245.0",
      "color": 7506394
    },
    {
      "title": "7th Heaven is FOSS Software!",
      "description": "7th Heaven is released under MS-PL license. More info here: https://github.com/federicorosso1993/7th-Heaven-DRM-Free#license",
      "color": 15746887
    }
  ]
}
"@

Invoke-RestMethod -Uri $env:_MAP_7TH_INTERNAL -ContentType "application/json" -Method Post -Body $discordPost
Invoke-RestMethod -Uri $env:_MAP_7TH_QHIMM -ContentType "application/json" -Method Post -Body $discordPost
Invoke-RestMethod -Uri $env:_MAP_7TH_TSUNAMODS -ContentType "application/json" -Method Post -Body $discordPost
