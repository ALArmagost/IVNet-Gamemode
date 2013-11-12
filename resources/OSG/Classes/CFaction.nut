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
 *  @file: CFaction.nut
 *	@desc: Contains the faction class.
 *	@init-author: Jan Christophersen
 *	@date: 09.11.2013
 */

// Put small functions into the class definition
class
	CFaction
{

	// Variables
	m_iColor		=	0;
	m_strName		=	"";
	m_tAreas		=	{};
	m_tMembers		=	{};
	m_tSpawnCoords	=	{};

	function constructor (strName, iColor = 0xFFFFFF)
	{
		// (Re)set vars
		m_iColor		=	iColor;
		m_strName 		=	strName;
		m_tMembers 		=	{};
		m_tAreas 		=	{};

		m_tSpawnCoords 	= { "fX" : 0.0, "fY" : 0.0, "fZ" : 0.0, "fRot" : 0.0 };

	}

	function Add (enPlayer)
	{
		if (m_tMembers.rawin(enPlayer))
			return false;

		m_tMembers [enPlayer] <- enPlayer;
	}

	function Broadcast (strMessage, iColor = -1)
	{
		if (iColor == -1)
			iColor = m_iColor;

		foreach (i, val in m_tMembers)
		{
			val.sendMessage(strMessage, iColor, true);
		}
		return true;
	}

	function GetMembers ()
		return m_tMembers;

	function GetName ()
		return m_strName;

	function Remove (enPlayer)
	{
		if (!m_tMembers.rawin(enPlayer))
			return false;

		delete m_tMembers [enPlayer];
	}

	function SetSpawnCoordinates (fX, fY, fZ, fRot = 0.0)
	{
		m_tSpawnCoords.fX = fX;
		m_tSpawnCoords.fY = fY;
		m_tSpawnCoords.fZ = fZ;
		m_tSpawnCoords.fRot = fRot;
	}

}

// Put functions that take many lines and/or need documentation here

/*
 *	function CFaction::BroadcastEx (aciExceptions, strMessage, iColor = -1)
 *
 *	Description:
 *		Sends a message to all faction members except the players that are in the first parameter.
 *
 *	Parameter(s):
 *		<array/insance>	aciExceptions	-	The player(s) that won't get a message.
 *		<string>		strMessage		-	The message that should be broadcasted
 *		<integer>		iColor 			-	The message color. Default is the faction color.
 *
 *	Return:
 *		This function returns a bool whether the function succeeded or not.
 */
function CFaction::BroadcastEx (aciExceptions, strMessage, iColor = -1)
{
	local tExceptions = {};

	if (typeof(aciExceptions) == "instance")
		tExceptions [aciExceptions] <- aciExceptions;
	else if (typeof(aciExceptions) == "array")
	{
		foreach (i, val in aciExceptions)
		{
			if (typeof(val) != "instance")
				continue;

			tExceptions [val] <- val;
		}
	}
	else
	{
		log("Invalid aciExceptions (" + typeof(aciExceptions) + ") in CFaction::BroadcastEx", LOG_WARNING);
		return false;
	}

	if (iColor == -1)
		iColor == m_iColor;

	foreach (i, val in m_tMembers)
	{
		if (tExceptions.rawin(val))
			continue;

		val.sendMessage(strMessage, iColor, true);
	}

	return true;
}