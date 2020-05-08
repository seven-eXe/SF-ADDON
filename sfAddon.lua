local module = {}

local ffi = require "ffi"

module._AUTHOR = "seven.eXe"
module._VERSION = "1.1"

ffi.cdef[[
    struct stSAMP
    {
        void					*pUnk0;
        void			        *pServerInfo;
        uint8_t					byteSpace[24];
        char					szIP[257];
        char					szHostname[259];
        bool					bNametagStatus;
        uint32_t				ulPort;
        uint32_t				ulMapIcons[100];
        int						iLanMode;
        int						iGameState;
        uint32_t				ulConnectTick;
        struct stServerPresets	*pSettings;
        void					*pRakClientInterface;
        void		            *pPools;
    }__attribute__ ((packed));

    struct stServerPresets
    {
        uint8_t                 byteCJWalk;
        int                     m_iDeathDropMoney;
        float	                fWorldBoundaries[4];
        bool                    m_bAllowWeapons;
        float	                fGravity;
        uint8_t                 byteDisableInteriorEnterExits;
        uint32_t                ulVehicleFriendlyFire;
        bool                    m_byteHoldTime;
        bool                    m_bInstagib;
        bool                    m_bZoneNames;
        bool                    m_byteFriendlyFire;
        int		                iClassesAvailable;
        float	                fNameTagsDistance;
        bool                    m_bManualVehicleEngineAndLight;
        uint8_t                 byteWorldTime_Hour;
        uint8_t                 byteWorldTime_Minute;
        uint8_t                 byteWeather;
        uint8_t                 byteNoNametagsBehindWalls;
        int                     iPlayerMarkersMode;
        float	                fGlobalChatRadiusLimit;
        uint8_t                 byteShowNameTags;
        bool                    m_bLimitGlobalChatRadius;
    }__attribute__ ((packed));
]]

SampInfo = ffi.cast('struct stSAMP*', sampGetSampInfoPtr())

function module.sampGetNametagStatus()
    return SampInfo.bNametagStatus
end

function module.sampGetLanMode()
    return SampInfo.iLanMode
end

function module.sampGetCJWalkStatus()
    return SampInfo.pSettings.byteCJWalk
end

function module.sampGetWorldBoundaries()
    return SampInfo.pSettings.fWorldBoundaries[1], SampInfo.pSettings.fWorldBoundaries[2], SampInfo.pSettings.fWorldBoundaries[3], SampInfo.pSettings.fWorldBoundaries[4]
end

function module.sampGetGlobalGravity()
    return SampInfo.pSettings.fGravity
end

function module.sampGetStatusDisableInteriorEnterExits()
    return SampInfo.pSettings.byteDisableInteriorEnterExits
end

function module.sampGetNametagRenderDistance()
    return SampInfo.pSettings.fNameTagsDistance
end

function module.sampGetNametagsRenderStatusBehindWalls()
    return SampInfo.pSettings.byteNoNametagsBehindWalls
end

function module.sampGetGlobalChatRadiusLimit()
    return SampInfo.pSettings.fGlobalChatRadiusLimit
end

function module.sampSetNametagStatus(value)
    ffi.cast("bool", value)
    SampInfo.bNametagStatus = value
end

function module.sampSetWorldBoundaries(x_max, x_min, y_max, y_min)
    ffi.cast("float", x_max, x_min, y_max, y_min)
    SampInfo.pSettings.fWorldBoundaries[1], SampInfo.pSettings.fWorldBoundaries[2], SampInfo.pSettings.fWorldBoundaries[3], SampInfo.pSettings.fWorldBoundaries[4] = x_max, x_min, y_max, y_min
end

function module.sampSetNametagRenderDistance(distance)
    ffi.cast("float", distance)
    SampInfo.pSettings.fNameTagsDistance = distance
end

function module.sampSetNametagsRenderStatusBehindWalls(status)
    ffi.cast("uint8_t", status)
    SampInfo.pSettings.byteNoNametagsBehindWalls = status
end

return module