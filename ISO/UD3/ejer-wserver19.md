# ISO UD3 - EJER - Windows Server 2019 VM

- Descargar ISO via [Microsoft](https://www.microsoft.com/es-es/evalcenter/download-windows-server-2019)

## installation

- WS2019 Standard Evaluation (**Experiencia de escritorio**)

- Custom Installation on Disk
  - 500MB System-Reserved
  - 39.5GB for System
  - 10GB for User Data

![partz](/ISO/UD3/ejer-ws2019-partz.png)

- Admin & Users
  - Admin == minas7!

- Login == `RightCtrl+Supr`


## vewry slow

### @ForumsVirtualbox: [Windows Server 2019 running very slow (unusable)](https://forums.virtualbox.org/viewtopic.php?f=6&t=106110)

```markdown
Please right-click the guest in the main Virtualbox window's guest list, choose Show Log.
Search the far left tab's log for this text:
'Attempting fall back to NEM'
If you find it, Hyper-V is enabled. See HMR3Init: Attempting fall back to NEM (Hyper-V is active).
If you don't find that text, save the far left tab's log, zip the log file, and post the zip file, using the forum's Upload Attachment tab.
```` 

```log
00:00:02.468741 ********************* End of CFGM dump **********************
00:00:02.468829 HM: HMR3Init: Attempting fall back to NEM: VT-x is not available
00:00:02.522696 NEM:  info: Found optional import WinHvPlatform.dll!WHvQueryGpaRangeDirtyBitmap.
00:00:02.522748 NEM: WHvCapabilityCodeHypervisorPresent is TRUE, so this might work...
00:00:02.522750 NEM: WHvCapabilityCodeExtendedVmExits      = 0x0000000000007fff
00:00:02.522754 NEM:                       fExtendedMsrExit: 1
00:00:02.522757 NEM:                     fExtendedCpuIdExit: 1
00:00:02.522759 NEM:                      fExtendedXcptExit: 1
00:00:02.522761 NEM: Warning! Unknown VM exit definitions: 0x7fff
00:00:02.522763 NEM: Warning! Unknown feature definitions: 0x2ff
00:00:02.522765 NEM: Supported exception exit bitmap: 0xf7dfb
00:00:02.522769 NEM: WHvCapabilityCodeProcessorVendor      = 1 - Intel
00:00:02.522778 NEM: WHvCapabilityCodeProcessorFeatures    = 0x0e1b7bcfe7f7859f
00:00:02.522780 NEM:                            Sse3Support: 1
00:00:02.522782 NEM:                        LahfSahfSupport: 1
00:00:02.522784 NEM:                           Ssse3Support: 1
00:00:02.522787 NEM:                          Sse4_1Support: 1
00:00:02.522789 NEM:                          Sse4_2Support: 1
00:00:02.522791 NEM:                           Sse4aSupport: 0
00:00:02.522793 NEM:                             XopSupport: 0
00:00:02.522796 NEM:                          PopCntSupport: 1
00:00:02.522798 NEM:                      Cmpxchg16bSupport: 1
00:00:02.522800 NEM:                       Altmovcr8Support: 0
00:00:02.522802 NEM:                           LzcntSupport: 1
00:00:02.522804 NEM:                     MisAlignSseSupport: 0
00:00:02.522806 NEM:                          MmxExtSupport: 0
00:00:02.522808 NEM:                        Amd3DNowSupport: 0
00:00:02.522811 NEM:                ExtendedAmd3DNowSupport: 0
00:00:02.522813 NEM:                         Page1GbSupport: 1
00:00:02.522814 NEM:                             AesSupport: 1
00:00:02.522817 NEM:                       PclmulqdqSupport: 1
00:00:02.522819 NEM:                            PcidSupport: 1
00:00:02.522821 NEM:                            Fma4Support: 0
00:00:02.522823 NEM:                            F16CSupport: 1
00:00:02.522825 NEM:                          RdRandSupport: 1
00:00:02.522827 NEM:                        RdWrFsGsSupport: 1
00:00:02.522829 NEM:                            SmepSupport: 1
00:00:02.522831 NEM:              EnhancedFastStringSupport: 1
00:00:02.522833 NEM:                            Bmi1Support: 1
00:00:02.522835 NEM:                            Bmi2Support: 1
00:00:02.522837 NEM:                           MovbeSupport: 1
00:00:02.522839 NEM:                          Npiep1Support: 1
00:00:02.522841 NEM:                   DepX87FPUSaveSupport: 1
00:00:02.522843 NEM:                          RdSeedSupport: 1
00:00:02.522845 NEM:                             AdxSupport: 1
00:00:02.522847 NEM:                   IntelPrefetchSupport: 1
00:00:02.522849 NEM:                            SmapSupport: 1
00:00:02.522851 NEM:                             HleSupport: 0
00:00:02.522853 NEM:                             RtmSupport: 0
00:00:02.522855 NEM:                          RdtscpSupport: 1
00:00:02.522857 NEM:                      ClflushoptSupport: 1
00:00:02.522859 NEM:                            ClwbSupport: 1
00:00:02.522861 NEM:                             ShaSupport: 1
00:00:02.522863 NEM:                X87PointersSavedSupport: 0
00:00:02.522865 NEM: Warning! Unknown CPU features: 0xe1b7bcfe7f7859f
00:00:02.522869 NEM: WHvCapabilityCodeProcessorClFlushSize = 2^8
00:00:02.522872 NEM: Warning! Unknown capability 0x4 returning: 3f 00 00 00 00 00 00 00
00:00:02.522875 NEM: Warning! Unknown capability 0x5 returning: 03 00 00 00 00 00 00 00
00:00:02.522884 NEM: Warning! Unknown capability 0x6 returning: 00 00 00 00 00 00 00 00
00:00:02.523116 NEM: Warning! Unknown capability 0x1003 returning: df ff 7f 01 00 00 00 00
00:00:02.523123 NEM: Warning! Unknown capability 0x1004 returning: 34 37 54 89 00 00 00 00
00:00:02.523125 NEM: Warning! Unknown capability 0x1005 returning: 00 c2 eb 0b 00 00 00 00
00:00:02.523153 NEM: Warning! Unknown capability 0x1009 returning: 03 00 00 00 00 00 00 00
00:00:02.523612 NEM: Created partition 0000000001d74800.
00:00:02.523713 NEM: NEMR3Init: Active.
00:00:02.523721 MM: cbHyperHeap=0x240000 (2359296)
00:00:02.528080 CPUM: No hardware-virtualization capability detected
```

### @ForumsVirtualbox: [HMR3Init: Attempting fall back to NEM (Hyper-V is active)](https://forums.virtualbox.org/viewtopic.php?f=25&t=99390)

> Instructions not applied: might mess up my WSL config