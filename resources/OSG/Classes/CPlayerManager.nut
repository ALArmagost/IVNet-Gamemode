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
 *  @file: CPlayerManager.nut
 *	@desc: Our player manager
 *	@init-author: Jan Christophersen
 *	@date: 03.11.2013
 */

local m_Instance = null; // Need this here for singleton

class
	CPlayerManager
{
	// Variables
	m_tPlayers = null;

	function constructor ()
	{
		if (m_Instance != null)
			return log("CPlayerManager was initialized earlier.", LOG_ERROR);

		// Setting the instance
		m_Instance = this;

		// Resetting vars
		m_tPlayers = {};

		debug("CPlayerManager initialized.")
		return true;
	}

	function Add (enPlayer)
	{
		if (Exists(enPlayer))
			return false;

		/*	TODO:
		 *	-Load from DB/File
		 */

		// (re)set player vars
		enPlayer.m_tSkills		= {};
		enPlayer.m_tVehicles	= {};
		enPlayer.m_tWeapons		= {};
	}

	function Exists (strEnPlayer)
	{
		// Can be either the class instance or the player name
		foreach (i, val in m_tPlayers)
		{
			if (val == strEnPlayer || val.getName() == strEnPlayer)
				return true;
		}
		return false;
	}

	function Remove (enPlayer)
	{
		/*	TODO:
		 *	-Reset everything
		 */
	}
}

/*
 *	function CPlayerManager::Broadcast (strMessage, xColor = 0xFFFFFF, bFormatting = true)
 *
 *	Description:
 *		Broadcasts a message to all players
 *
 *	Parameter(s):
 *		<string>	strMessage	-	the message
 *		<integer>	xColor		-	the color of the message
 *		<bool>		bFormatting	-	allow string color formatting 
 *
 *	Return:
 *		This function returns what sendMessageToAll returns.
 */
function CPlayerManager::Broadcast (strMessage, xColor = 0xFFFFFF, bFormatting = true)
	return sendPlayerMessageToAll(strMessage, xColor, bFormatting);

/*
 *	function CPlayerManager::Get (iStrPlayer)
 *
 *	Description:
 *		Returns the player instance by comparing the id or name.
 *
 *	Parameter(s):
 *		<integer/string>	iStrPlayer	-	the name or id of the player we want to get 
 *
 *	Return:
 *		This function returns the instance of the player or false if there was no matching player.
 */
function CPlayerManager::Get (iStrPlayer)
{
	// Let's split this function so we wont produce errors
	if (typeof(iStrPlayer) == "integer")
	{
		foreach (i, val in m_tPlayers)
			if (val.getId() == iStrPlayer) return true;
	}
	else if (typeof(iStrPlayer) == "string")
	{
		foreach (i, val in m_tPlayers)
			if (val.getName() == iStrPlayer) return true;
	}

	return false;
}