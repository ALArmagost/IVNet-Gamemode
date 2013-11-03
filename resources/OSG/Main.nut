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
 *  @file: Main.nut
 *	@desc: Main file of OSG.
 *	@init-author: Jan Christophersen
 *	@date: 23.10.2013
 */

local g_strResourceName = MODE_NAME_SHORT;

/*
 *	function Main ()
 *	
 *	Description:
 *		This function is called upon the initialization of OSG.
 *	
 *	Parameter(s):
 *	
 *	Return:
 *		This function returns a bool whether the function succeeded or not.
 */
function Main (strResourceName)
{
	if (strResourceName != g_strResourceName)
		return false;
	
	log(MODE_NAME_LONG + " (version " + MODE_VERSION + ") initialized.", LOG_SUCCESS);
	debug("Debug mode is active.");
	return true;
}
addEvent("resourceStarted", Main);