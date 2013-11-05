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
 *  @file: Utility.nut
 *	@desc: Contains "everyday" functions
 *	@init-author: Jan Christophersen
 *	@date: 02.11.2013
 */

/*
 *	function debug (strMessage)
 *
 *	Description:
 *		prints out a debug message (if DEBUG_MODE is true)
 *		
 *
 *	Parameter(s):
 *		<strMessage>	-	The string that will be sent to the console
 *
 *	Return:
 *		boolean that gets returned by the print function if DEBUG_MODE is enabled, false if not.
 */
function debug (strMessage)
	return (DEBUG_MODE) ? print("[DEBUG]   | " + strMessage, 4) : false;


/*
 *	function USAGE (...)
 *
 *	Description:
 *		Creates a string for command usage.
 *
 *	Return:
 *		This function returns a bool whether the function succeeded or not.
 */
function USAGE (...)
{
	local strUsage = "";

	foreach(i, val in vargv)
		strUsage += "[" + val + "] ";

	return strUsage;
}