DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x0)
{
    External (\_SB.PCI0.HPET, DeviceObj)
    External (\_SB.PCI0.HPET.XCRS, MethodObj)
    External (\_SB.PCI0.HPET.XSTA, MethodObj)

    Scope (\_SB.PCI0.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8,11}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
            )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If (_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.HPET.XCRS))
            {
                Return (BUFX)
            }
            Return (\_SB.PCI0.HPET.XCRS ())
        }
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.HPET.XSTA))
            {
                Return (0x0F)
            }
            Return (\_SB.PCI0.HPET.XSTA ())
        }
    }
}