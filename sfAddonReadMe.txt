all Functions:
return bool = sampGetNametagStatus() // Returns the status of drawing nicknames
return int = sampGetLanMode() // Returns the status of the LAN (0 - disabled, 1 - enabled)
return uint8_t = sampGetCJWalkStatus() // Returns the status of enabling the standard player walking animation (0 - disabled, 1 - enabled)
return float:x_max, x_min, y_max, y_min = sampGetWorldBoundaries() // Returns coordinates of world restrictions
return float = sampGetGlobalGravity() // Returns the global gravity of the server
return uint8_t = sampGetStatusDisableInteriorEnterExits() // Returns the enabling status of standard enter/exit pickups
return float = sampGetNametagRenderDistance() // Returns the distance for drawing nicknames
return uint8_t = sampGetNametagsRenderStatusBehindWalls() // Returns the status of enabling drawing nicknames through walls
return float = sampGetGlobalChatRadiusLimit() // suck

sampSetNametagStatus(bool) // Set status of drawing nicknames
sampSetWorldBoundaries(x_max, x_min, y_max, y_min) // Set coordinates of world restrictions
sampSetNametagRenderDistance(distance)
sampSetNametagsRenderStatusBehindWalls(status)