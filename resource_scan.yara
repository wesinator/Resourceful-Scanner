import "pe"

rule microsoft_windows_legacy_system_version_info
{
meta:
    description = "Detects PE file resource version info metadata matching legacy versions of Windows system applications and libraries."
    hash = "e7d6ce993d02d1bfff33216dd90cc82f7386553fb42c9374cf9dcca8f130b0a5"
condition:
    uint16(0) == 0x5a4d and
    pe.version_info["CompanyName"] matches /Microsoft Corporation/i and
    pe.version_info["FileVersion"] matches /\b(5|6)\.\d\.\d{4}\.\d{4,5}/i
}
