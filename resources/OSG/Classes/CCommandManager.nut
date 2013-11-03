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
 *  @file: CCommandManager.nut
 *	@desc: Manages all of our commands
 *	@init-author: Jan Christophersen
 *	@date: 03.11.2013
 */

local m_Instance = null; // Singleton

class
	CCommandManager
{
	m_tCommands = null;

	function constructor ()
	{
		if (m_Instance != null)
			return log("CCommandManager was initialized earlier.", LOG_ERROR);

		// Set our instance
		m_Instance = this;

		// Reset the table
		m_tCommands = {};
	}

	function Add (strANames, fFunction)
	{
		// Lets check if the command has only one name or multiple first
		if (typeof(strANames) == "string")
		{
			if (m_tCommands.rawin(strANames))
			{
				log(strANames + " has already a handler.", LOG_ERROR);
				return false;
			}
			m_tCommands [strANames] <- fFunction;
			return true;
		}
		else if (typeof(strANames) == "array")
		{
			foreach(i, val in strANames)
			{
				if (m_tCommands.rawin(val))
				{
					log("could not register " + val + ".", LOG_ERROR);
					continue;
				}

				m_tCommands [val] <- fFunction;
			}
			return true;
		}
		else
			log("Invalid strANames type (" + typeof(strANames) + ")?", LOG_ERROR);
		return false;
	}

	function Handle (enPlayer, strCommand)
	{
		local cmd = split(strCommand, " ");
		local varg = {};
		foreach (i, val in cmd)
		{
			if (i == 0)
				continue;

			varg [i - 1] <- cmd [i];
		}

		if(m_tCommands.rawin(cmd [0].slice (1, cmd [0].len())))
			return m_tCommands [cmd [0].slice (1, cmd [0].len())](enPlayer, varg);
		else
			return false;
	}
}