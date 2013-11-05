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

	function Add (strANames, strAUsage, strFunction)
	{
		// Lets check if the command has only one name or multiple first
		if (typeof(strANames) == "string")
		{
			if (m_tCommands.rawin(strANames))
			{
				log(strANames + " has already a handler.", LOG_ERROR);
				return false;
			}
			m_tCommands [strANames] <- {};
			m_tCommands [strANames].Handler <- strFunction;

			if (typeof(strAUsage) != "string")
			{
				log("Multiple usage messages for one command? (" + strANames + ")", LOG_WARNING);
				m_tCommands [strANames].Usage <- "/" + strANames + " " + strAUsage [0];
			}
			else
				m_tCommands [strANames].Usage <- "/" + strANames + " " + strAUsage;

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

				m_tCommands [val] <- {};
				m_tCommands [val].Handler <- strFunction;

				if (typeof(strAUsage) == "string")
					m_tCommands [val].Usage <- "/" + val + " " + strAUsage;
				else if (typeof(strAUsage) == "array")
				{
					m_tCommands [val].Usage <- "/" + val + " " + strAUsage [i];
				}
				else
				{
					log("Invalid type for strAUsage in command " + val + ".", LOG_ERROR);
					return false;
				}
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

		local strCommandName = cmd [0].slice (1, cmd [0].len());

		if (!m_tCommands.rawin(strCommandName))
		{
			if (enPlayer == null)
				debug("Invalid command.")
			else
				enPlayer.sendMessage("Invalid command.");

			return false;
		}

		local tCommand = m_tCommands [strCommandName];
		
		// Create the prototype for our call
		// You may ask yourself why we are putting the player id into the parameter.
		// The reason is simple: We can't pass instances/functions/classes via the compilestring function.
		// So, sadly, we have to retreive the player entity from our player manager in each command.
		local strCall = "return " + tCommand.Handler

		if (enPlayer == null)
			strCall += "(null";
		else
			strCall += "(" + enPlayer.getId() + "";

		if (cmd.len() > 1)
		{
			foreach(i, val in cmd)
			{
				if (i == 0)
					continue;

				if (typeof(val) == "string")
					strCall += ", \"" + val + "\"";
				else
					strCall += ", " + val;
			}
		}
		
		strCall += ");";

		try 
		{
			return compilestring(strCall)();
		}
		catch (e)
		{
			if (e.find ("argument") != false)
			{
				if (enPlayer == null)
					debug(tCommand.Usage)
				else
					enPlayer.sendMessage(tCommand.Usage);
			}
			else
			{
				log("", LOG_NOPREFIX)
				log("", LOG_NOPREFIX)
				log("--------------------------------------------------------------------------------", LOG_NOPREFIX);
				log("Invalid CommandHandler ? [" + tCommand.Handler + "].", LOG_WARNING);
				log("Error Message: " + e, LOG_WARNING);
				log("--------------------------------------------------------------------------------", LOG_NOPREFIX);
				log("", LOG_NOPREFIX)
				log("", LOG_NOPREFIX)
			}
			return false;
		}

	}
}