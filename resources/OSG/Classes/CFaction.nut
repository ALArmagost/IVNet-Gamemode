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

	function GetMembers ()
		return m_tMembers;

	function GetName ()
		return m_strName;

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

	function SetSpawnCoordinates (fX, fY, fZ, fRot = 0.0)
	{
		m_tSpawnCoords.fX = fX;
		m_tSpawnCoords.fY = fY;
		m_tSpawnCoords.fZ = fZ;
		m_tSpawnCoords.fRot = fRot;
	}

	function Add (enPlayer)
	{
		if (m_tMembers.rawin(enPlayer))
			return false;

		m_tMembers [enPlayer] <- enPlayer;
	}

}