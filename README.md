# macOS on Lenovo Legion 5 pro (aka r9000p 2021H)

## Table of Contents

- [Specifications](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#specifications)
- [macOS Compatibility](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#macos-update-history)
- [What's working](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#whats-working)
- [What's not working](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#whats-not-working)
- [Instructions](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#instructions)
- [Notes](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#notes)
- [Kexts used](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#Kexts-used)
- [SSDTs used](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#SSDTs-used)
- [Credits](https://github.com/extremegrief1/Lenovo_Legion_5_Hackintosh#credits)


## Specifications

Type | Spec | Status
:---------|:---------|:----------
Model Name      | Lenovo Legion 5 pro | ✅
CPU              | AMD Ryzen™ 7 5800H CPU | ✅
iGPU | Vega 8 | ✅
RAM           | 32 GB 3200 MHz DDR4 | ✅
Wi-Fi             | Intel® Wi-Fi 6 AX200 | ✅
Ethernet          | Realtek RTL8111 | ✅
Audio       | Realtek ALC287 | ✅

## macOS Update History

- ✅ macOS Monterey 12.6.1
- ✅ macOS Ventura 13.3.1
- ✅ macOS 14.0b1
  
## What's working

Type | Status
:---------|:----------
CPU | ✅
AMD iGPU Acceleration | ✅
CPU & GPU Power Management | ✅
Audio | ✅
Ethernet | ✅
Intel Wi-Fi | ✅
Bluetooth | ✅
USB | ✅
Battery Status | ✅
Shutdown / Reboot |✅
Trackpad | ✅

## What's not working

Type | Info | Status
:---------|:---------|:----------
USB | At the moment we need to disable one of the two USB controllers, so the ports connected to it will NOT work even in other OSes, until the setting is reverted in UMAF. (fixed after add GenericUSBXHCI ,only need to disbale 1 XHC port during install)| ⚠️
Sleep | PowerPlay panic on wake, still investigating | ⚠️


## Instructions

### Pre-Installation

#### Disabling XHC1

> **Warning**
>
> Do NOT edit any settings except what you're told to if you don't know what you're doing. I am not responsible for any harm done to your laptop.

Download [Universal AMD Form Browser](https://github.com/DavidS95/Smokeless_UMAF/blob/main/UniversalAMDFormBrowser.zip)

1.  Format an USB drive as **GPT + FAT32** with Rufus and copy the files included in the zip to the newly created partition
2.  Boot from your USB drive
3.  Navigate to **Device Manager** > **AMD CBS** > **FCH Common Options** > **USB Configuration Options** > **XHCI1 Controller Enable**: Change to **Disabled**
4.  ESC to back and press **Y** when prompted to save, ESC to back, then **Reset** on first menu

![](https://user-images.githubusercontent.com/8891448/226887440-8712f449-cc25-43e4-9fb4-1afac1c74b54.gif)

> Thanks to @kalfmann for the GIF.

#### Changing your SMBIOS data

Download and run [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)
Type 2 and select your **config.plist**, then type 3 and type **MacBookPro16,4**

#### Changing your CPU name

If you CPU is not **AMD Ryzen™ 7 5800H**, download [CPU-Name](https://github.com/corpnewt/CPU-Name), and follow its instructions.

### Post-installation notes

After you're at the macOS desktop, running [@mikigal's script](https://github.com/mikigal/ryzen-hackintosh/blob/master/Resources/ryzen_patch.sh) to set MKL Debug settings is recommended.
```bash
source <(curl -s https://raw.githubusercontent.com/mikigal/ryzen-hackintosh/master/Resources/ryzen_patch.sh)
```


## Kexts used

Kext | Info
:---------|:---------
[AirportItlwm](https://github.com/OpenIntelWireless/itlwm) | Intel Wi-Fi support. Disable for MediaTek Wi-Fi
[AMDRyzenCPUPowerManagement](https://github.com/trulyspinach/SMCAMDProcessor) | AMD CPU Power Management
[AppleALC](https://github.com/acidanthera/AppleALC) | Fixes audio
[AppleMCEReporterDisabler](https://files.amd-osx.com/AppleMCEReporterDisabler.kext.zip) | Disables AppleIntelMCEReporter which causes panics on AMD CPUs
[ECEnabler](https://github.com/1Revenger1/ECEnabler) | Battery reading fixes
[FeatureUnlock](https://github.com/acidanthera/FeatureUnlock) | Fix Continuity Camera on macOS Ventura
[Lilu](https://github.com/acidanthera/Lilu) | Patch Engine
[NVMeFix](https://github.com/acidanthera/NVMeFix) | NVMe Power Management
[RadeonSensor](https://github.com/aluveitie/RadeonSensor) | Temperature readings for AMD GPUs. Disable for NVIDIA GPUs
[RealtekRTL8111](https://github.com/Mieze/RTL8111_driver_for_OS_X) | Ethernet driver
[RestrictEvents](https://github.com/acidanthera/RestrictEvents) | Change CPU Name
[SMCAMDProcessor](https://github.com/trulyspinach/SMCAMDProcessor) | Companion to AMDRyzenCPUPowerManagement
[SMCBatteryManager](https://github.com/acidanthera/VirtualSMC) | Enables battery reading
[SMCRadeonGPU](https://github.com/aluveitie/RadeonSensor) | Companion to RadeonSensor. Disable for NVIDIA GPUs
[USBToolBox](https://github.com/USBToolBox/kext) | Useful USB ACPI renames and prerequisite for UTBMap
[UTBMap](https://github.com/USBToolBox/tool) | USB Map
[VirtualSMC](https://github.com/acidanthera/VirtualSMC) | Advanced Apple SMC emulator in the kernel
[VoodooPS2Controller](https://github.com/acidanthera/VoodooPS2) | PS/2 Keyboard support
[NootedRed](https://github.com/NootInc/NootedRed) | iGPU patches
[GenericUSBXHCI](https://github.com/RattletraPM/GUX-RyzenXHCIFix) | Ryzen USB patches

  
## SSDTs Used
  
SSDT | Info
:---------|:---------
[SSDT-PLUG-ALT](/Extras/Decompiled%20ACPI%20Files/SSDT-CPUR.dsl) | Fixes CPU definitions.
[SSDT-EC](/Extras/Decompiled%20ACPI%20Files/SSDT-EC.dsl) | Adds a fake Embedded Controller device.
[SSDT-SBUS-MCHC](/Extras/Decompiled%20ACPI%20Files/SSDT-SBUS-MCHC.dsl) | Fixes AppleSMBus.
[SSDT-USBX](/Extras/Decompiled%20ACPI%20Files/SSDT-USBX.dsl) | Enables USB Power Management.
[SSDT-XOSI](/Extras/Decompiled%20ACPI%20Files/SSDT-XOSI.dsl) | Spoof macOS to Windows for some ACPI features.

## SSDTs Unused
[SSDT-HPET](/) | conflict with trackpad, so removed.

## Credits

- [Dortania](https://dortania.github.io) for their awesome guides.
- [Apple](https://www.apple.com) for macOS.
- [Acidanthera](https://github.com/acidanthera) for OpenCore and most Kexts.
- [yusufklncc](https://github.com/yusufklncc) for README template.
- And anyone else that helped to develop and improve hackintoshing.
- Legion 5 EFI from https://github.com/ExtremeXT/
