/*
 *	This file is part of IVNet-Gamemode (OSG).
 *
 *  IVNet-Gamemode (OSG) is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  IVNet-Gamemode (OSG) is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.

 *  You should have received a copy of the GNU General Public License
 *  along with IVNet-Gamemode (OSG).  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  @file: PlayerEvents.nut
 *	@desc: Contains the handlers for player events
 *	@init-author: Jan Christophersen
 *	@date: 03.11.2013
 */

/*
 *	function onRequestRegistration (enPlayer, strPassword, iGender, iFaction)
 *
 *	Description:
 *		Parses the registration request of a player
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player
 *		<string>	strPassword	-	the chosen password
 *		<integer>	iGender		-	the player's gender
 *		<integer>	iFaction 	-	the chosen faction
 *
 *	Return:
 *		true if the registration request passed, wrong if not.
 */
function onRequestRegistration (enPlayer, strPassword, iGender, iFaction)
{
	if (!g_PlayerManager.Exists(enPlayer))
	{
		log("Player does not exist in CPlayerManager", LOG_WARNING);
		return false;
	}

	enPlayer.bRegistered = true;

	/*	TODO:
	 *	-Auto login
	 *	-Tutorial (maybe)?
	 */
	enPlayer.sendMessage("[TODO] Auto login / Save data etc", 0xFF0000);
	return true;
}

/*
 *	function onPlayerJoin (enPlayer)
 *
 *	Description:
 *		This handler gets called when a new player joins the server.
 *		We will make everything ready for the player here.
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player entity 
 *
 *	Return:
 *		void
 */
function onPlayerJoin (enPlayer)
{
	debug(enPlayer.getName() + " joined the server. ID: " + enPlayer.getId());

	// Add the player to the manager
	g_PlayerManager.Add(enPlayer);

	// Check if the Add method really succeeded
	if (!g_PlayerManager.Exists(enPlayer) && enPlayer.m_bLoaded)
		return unknownPlayerMessage(enPlayer);
}

/*
 *	function onPlayerCommand (enPlayer, strCommand)
 *
 *	Description:
 *		gets called when a player casts a command (/xyz).
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player that calls the command
 *		<string>	strCommand	-	the command + params. 
 *
 *	Return:
 *		void
 */
function onPlayerCommand (strCommand, enPlayer)
{
	if (!g_PlayerManager.Exists(enPlayer))
		return unknownPlayerMessage(enPlayer);

	return g_CommandManager.Handle(enPlayer, strCommand);
}

/*
 *	function onPlayerDisconnect (enPlayer)
 *
 *	Description:
 *		Gets called when the player leaves OSG
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player entity 
 *
 *	Return:
 *		void
 */
function onPlayerDisconnect (enPlayer)
{
	if (!g_PlayerManager.Exists(enPlayer))
		return unknownPlayerMessage(enPlayer);

	g_PlayerManager.Remove(enPlayer);
}

/*
 *	function onPlayerRequestSpawn (enPlayer)
 *
 *	Description:
 *		Will be called upon spawn request of player (when he finished loading everything)
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player entity 
 *
 *	Return:
 *		void
 */
function onPlayerRequestSpawn (enPlayer)
{
	if (!g_PlayerManager.Exists(enPlayer))
		return unknownPlayerMessage(enPlayer);

	local ciFaction = enPlayer.GetFaction();

	if (enPlayer.m_bFirstSpawn)
	{
		enPlayer.sendMessage("Hey, " + enPlayer.getName() + ". Your current level is " + enPlayer.m_iLevel + ".");

	    if (DEBUG_MODE)
	    {
	    	enPlayer.SetFaction("FACTION1");
	    	ciFaction = enPlayer.GetFaction(); // refresh the variable
	    }

	   	ciFaction.BroadcastEx(enPlayer, enPlayer.getName() + " logged in.");
	    enPlayer.sendMessage("You are a member of " + ciFaction.GetName() + ".");

	    enPlayer.m_bFirstSpawn = false;
	}
    
    /*	TODO:
     *	-Reset vars etc. ( Dont forget the client :-) )
     */
    enPlayer.spawn(ciFaction.m_tSpawnCoords.fX, ciFaction.m_tSpawnCoords.fY, ciFaction.m_tSpawnCoords.fZ, ciFaction.m_tSpawnCoords.fRot);
}

// Register all handlers
addEvent("playerJoin", onPlayerJoin);
addEvent("playerCommand", onPlayerCommand);
addEvent("playerDisconnect", onPlayerDisconnect);
addEvent("playerRequestSpawn", onPlayerRequestSpawn);

addEvent("requestRegistration", onRequestRegistration);