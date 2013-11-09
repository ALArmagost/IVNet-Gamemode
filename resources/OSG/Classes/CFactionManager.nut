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
 *  @file: CFactionManager.nut
 *	@desc: Contains the faction manager.
 *	@init-author: Jan Christophersen
 *	@date: 09.11.2013
 */

local m_Instance = null;

class
	CFactionManager
{

	// Variables
	m_tFactions		=	{};

	function constructor ()
	{
		if (m_Instance != null)
			return log("CFactionManager was initialized earlier.", LOG_WARNING);

		m_Instance 		= this;
		m_tFactions 	= {};
	}

	function GetFactions()
		return m_tFactions;

	function Add (strName, iColor = 0xFFFFFF)
	{
		if (m_tFactions.rawin(strName))
			return false;

		m_tFactions [strName] <- CFaction(strName, iColor);

		return m_tFactions [strName];
	}

	function Get (cstrName)
	{
		if (typeof(cstrName) == "instance")
		{
			if (cstrName instanceof CFaction)
				return cstrName;

			return false;
		}
		else if (typeof(cstrName) == "string")
		{
			if (!m_tFactions.rawin(cstrName))
				return false;

			return m_tFactions [strName];
		}
		return false;
	}

}