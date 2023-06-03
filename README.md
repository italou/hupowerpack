# Hunting Unlimited PowerPack

Hunting Unlimited PowerPack was the culmination of a personal project I had started back in 2007 on modding Hunting Unlimited games, and the contributions of some members of the HU Forum community at that time. 

This modding adventure started with simple things, such as changing the in-game weapons and animals specifications as well as changing their skins. 
Then it evolved into creating new in-game weapons and objects (unfortunately the 3D models had to be reused as the games didn't allowed for new 3D models), to fixing game bugs, adding new (and better) sounds and music, redesigned maps and peaking in removing the game (hardcoded) view/render and hunting distance caps - *on which I had to go on a side adventure to learn debugging and assembly so I could debug and change the game library files. Oh fun times with IDA Pro!! ;)*.

> **I no longer mod, or update the PowerPack!** I'm releasing the files here because even today I still get messages about the PowerPack and modding. Hopefully this can be useful for anyone that wants to follow up modding the game. 

> **DISCLAIMER:
THIS PACK WAS FULLY TESTED. NO RESPONSIBILITY IS TAKEN. INSTALL AND USE IT AT YOUR OWN RISK!**

## License
All content provided here was created under [Creative Commons Attribution-NonCommercial-ShareAlike International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).  
Hunting Unlimited is copyright of [SCS Software](https://www.scssoft.com).

## Installers
The installers are done using [Inno Setup](https://jrsoftware.org/isinfo.php).  
Each PowerPack folder contains the modded content as well as the installer script (*setup.iss*) and text files. For example, for HU 2010 will be under */HU2010pp*.
For the media files used in the installer, such as icons, they are under */inno_files*.

> **Note:** HU 2 and HU 3 use proprietary encrypted resources files, as such I'm only providing the PowerPack installation files.

## Download
To download the installation files, head to Releases.
> The current version of all PowerPacks is **v1.01**.

**Checksum (SHA256):**  
To validate if a installation file hasn't been altered, you can calculate the file checksum (SHA256), for example using [Get-FileHash](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-7.3), and compare with the following:
```
PS Hunting Unlimited PowerPacks\setup> Get-FileHash *

File                 Hash
---------            ----
HU2pp_V1_01.exe      6E915480787F9515AA06C1CB87FFB809BA0C816FB05E6F49A4D52A622379BBEC
HU3pp_V1_01.exe      CB741A1C53A8619D62BE86C3CC0564DDD357426F276752446C3A65FB76C98369
HU4pp_V1_01.exe      AD22BDC955D763B5CD839FCE3DA12C6BFD06BE2F45372352985161F605FE05BB
HU2008pp_V1_01.exe   5DE1141C50DA3BF51A8C443C80E1136E7DE620C30987FE898EF80268E4F78F12
HU2009pp_V1_01.exe   251E42044DD9379144901630D7CE3FF5DAF2426A48AEAF9BC4D934A512DD70DE
HU2010pp_V1_01.exe   AC9C642FFD74AEBE8D70B7013FE7D9A599ABA86C815013F52873F851291B3F03
```

## Content
The PowerPacks for HU 2008 and above contain the same content (detailed below), while HU 3 and HU 2 will have less due to game limitations. 
```
Weapons
----------------------------------------------------------------------------
  * .17 Remington BigArn Henry Lever (ita)
  * .223 Rem Lever action (HU Mod Squad)
  * .243 Remington Model 700 CDL (ita)
  * .25-06 Remington Model 700 CDL (ita)
  * .284 Lazzeroni Firebird (Big~Daddy)
  * .338 Sako TRG-42 (Bolt-Thrower)
  * .338 Lapua Magnum Timberwolf (Lone Wolf)
  * .408 Cheytac Timberwolf (Lone Wolf)
  * .300 WSM Barnes MRX Reptile Bolt (ita)
  * .30-06 Browning A-Bolt Stainless Stalker (ita)
  * .30-378 Debs Ultimate Hunter Xpecial Edition (ita)
  * .35 Whelen Remington Model 700 CDL (ita)
  * .416 Barrett Model 99 semi-auto (Imasniper)
  * .450 BushMaster Chameleon (ita)
  * .45 Muzzleloader (Lone Wolf)
  * .45 Colt Henry Lever (ita)
  * .50 BMG Bolt Action Rifle (Lone Wolf)
  * .50 FPB Hornady Muzzleloader (edwards72)
  * .577 T-Rex Double Rifle (MuratInce)
  * M107 SASR (Imasniper and ^v^LadyHawke^v^)
  * 7mm-08 Remington Model 700 CDL (ita)
  * 7mm Debs Big Girl Rem Ultra Mag (ita)
  * 7mm WSM Model 70 (ita)
  * 7.62x51mm M40A3 (3000yrd shot)
  * 7.62x54R Mosin Nagant M38 Rifle (Stormbringer)
  * 8mm Mauser bolt action rifle (Imasniper)
  * PzB 39 Panzerbuchse (Aussie Guy)
  * 12ga Browning Citori XS Sporting (ita)
  * 12ga Ithaca DeerSlayer III (ita & Arnoldwleedy)
  * 20ga Ithaca TurkeySlayer III (ita & Arnoldwleedy)
  * .44 Magnum 6 Shot Revolver (Aussie Guy)
  * .45 Auto M1911 (Imasniper)
  * .500 S&W Magnum Revolver (Lone Wolf)
  * 9mm USS ARIZONA Tribute Edition (edwards72)
  * PSE X-Force 7 GX Compound Bow (ita)
  * Jaguar Take-Down Black Recurve Bow (ita)

* Air Gun enabled


Scopes
----------------------------------------------------------------------------
  * 4.5-18x Leupold RF, 1.5 steps (Imasniper)
  * 5-22x Nightforce NXS quick zoom RF, 3.5 steps (Lone Wolf)
  * 8-40x Zeiss Rapid-Z Varmint RF, 4 steps (ita)
  * 8-40x Circle Duplex RF, 4 steps (ita)


Equipment
----------------------------------------------------------------------------
  * 20-60x Euro Spotting Camo Scope (ita)
  * 4-25x Spotting scope (Lone Wolf)
  * Doe Scent Wafers (ita)
  * Universal Call (ita)
  * Blood Scent (ita)
  * Red Ground Blind enabled (ita)
  * Tent Blind Camo's enabled (ita)
  * Tripod Camo (ita)
  * Forest King ATV (Bolt-Thrower)
  * Grizzly ATV (ita)
  * Black Horse (Imasniper)
  * Zebra Horse (ita)
  * Wolf Call (ita)
  * Wolf Decoy (ita)

* all equipment has its own ingame icons. (ita)


Hunters
----------------------------------------------------------------------------
  * ita (boy) Hunter - face, camo clothes/accessories and voices (ita)
  * Camo (man) Hunter - Camo hunter own camo clothes/face and voices (ita)
  * Tough (man) Hunter - face (ita)
  * Grandpa (man) Hunter - face (ita)
  * Blonde (lady) Hunter - face (ita)


Others
----------------------------------------------------------------------------
  * Weapon, Equipment and Gear selection menus fixed. (ita)
  * Game objects added to the User Missions Editor (ita)
  * Tent Blind ingame icon corrected. (ita)
  * Box Stand ingame icon corrected. (ita)
  * Hunters sound script fixed (ita)
  * New animals sounds. (ita)
  * New map musics. (ita)
  * Whitetail Deer antlers score fixed (ita).
  * "Big Game Sharpshooter" challenge weapon corrected.
  * "Snow on Africa" bug for online tourneys fixed.
  * All animals available in Free Hunt mode. (RugerMeister, Pat_Booned, ita)
  * HU Corner (Target) Range. (ita)
  * Shooting, RF and Viewing distance limits extended. (ita)
  * Increased number of generated animals on Free Hunt. (ita)
  * Enabled game mini maps for Free Hunt. (ita)

NOTES:

 * When you change the graphic options while in the game, the viewing distance will be
   reset to the old game limit. To have the increased view, just exit and enter the game.

 * When using all the available animal/species slots and setting them all to HIGH,
   your game will slow down due to the increased number of generated animals.
   The increased number of generated animals on HIGH setting is intended to be used when
   selecting few species to hunt.

 * When playing in the game mini maps (green valley and africa valley) watch out to not
   fall over. These maps don't have "borders". Also, the map doesn't work on mini maps.
```
