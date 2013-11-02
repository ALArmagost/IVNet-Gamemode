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
 *  @file: Hooks.nut
 *	@desc: This file hooks some IVNet functions.
 *	@init-author: Jan Christophersen
 *	@date: 23.10..2013
 */

local g_tOriginalFunctions 	= {}; // Table that contains the original functions
//local g_tHooks				= {}; // Table containing the hooks

// Placing the original functions into the table
g_tOriginalFunctions.print <- print;

/*
 *	function print (strMessage, iPriority = 0, bIsDebug = false)
 *
 *	Description:
 *		Prints a message (hook).
 *
 *	Parameter(s):
 *		<string>	strMessage	- The message to print
 *		<int>		iPriority	- The Priority of the message (INFO, WARNING or ERROR)
 *
 *	Return:
 *		The returnvalue of the real print function.
 */
function print (strMessage, iPriority = 0)
{
	switch (iPriority)
	{
		case 0:
			strMessage = "[INFO]    | " + strMessage;
		break;
		case 1:
			strMessage = "[WARNING] | " + strMessage;
		break;
		case 3:
			strMessage = "[SUCCESS] | " + strMessage;
		break;
		case 4: // Empty line
		break;
		default:
			strMessage = "[ERROR]   | " + strMessage;
		break;
	}                              
	return g_tOriginalFunctions.print (strMessage);
} 

/*
 *	function log (strMessage, iPriority = 0, bIsDebug = false)
 *
 *	Description:
 *		Prints a message (hook).
 *
 *	Parameter(s):
 *		<string>	strMessage	- The message to print
 *		<int>		iPriority	- The Priority of the message (INFO, WARNING or ERROR)
 *
 *	Return:
 *		The returnvalue of the real print function.
 */
function log (strMessage, iPriority = 0)
	return print (strMessage, iPriority)
