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

/*
 *	function handleError (strMessage)
 *
 *	Description:
 *		Custom error handler
 *
 *	Parameter(s):
 *		<string>	strMessage	-	the error message
 *
 *	Return:
 *		void
 */
function handleError (strMessage)
{
	log("", LOG_NOPREFIX);
	log("-----------------------------------[ERROR]--------------------------------------", LOG_NOPREFIX);
	log("ERROR MESSAGE: " + strMessage, LOG_NOPREFIX);
	log("", LOG_NOPREFIX)

	local i = 2;
	local sinfo = getstackinfos(i);

	if (sinfo.func == "assert")
	{
		i++;
		sinfo = getstackinfos(i); // Kill the assert info
	}

	if (sinfo.src.find(MODE_NAME_SHORT) != null)
		sinfo.src = sinfo.src.slice(sinfo.src.find(MODE_NAME_SHORT) + MODE_NAME_SHORT.len(), sinfo.src.len());

	if (sinfo.src == "NATIVE")
		sinfo.src = "native function";
	log("FUNCTION: " + sinfo.func + ", line " + sinfo.line, LOG_NOPREFIX);
	log("FILE: " + sinfo.src, LOG_NOPREFIX);
	log("", LOG_NOPREFIX);
	log("LOCALS:", LOG_NOPREFIX);
	local strLocals = "";
	local strCallstack = "";
	while (sinfo != null)
	{
		sinfo = getstackinfos(i);
		i++;

		if (sinfo == null)
			break;

		foreach (i2, val in sinfo.locals)
		{
			if(i2 == "this")
				continue;


			strLocals += "	[" + i2 + "]: " + val + "\n";
		}

		if (sinfo.src.find(MODE_NAME_SHORT) != null)
			sinfo.src = sinfo.src.slice(sinfo.src.find(MODE_NAME_SHORT) + MODE_NAME_SHORT.len(), sinfo.src.len());
		if (sinfo.func == "NATIVE")
			strCallstack += "-- NATIVE CALL --\n";
		else
			strCallstack += "	" + sinfo.func + " [line " + sinfo.line + ", " + sinfo.src + "]\n";
	}
	log(strLocals, LOG_NOPREFIX);
	log("CALLSTACK:", LOG_NOPREFIX);
	log(strCallstack, LOG_NOPREFIX);
	log("---------------------------------[ERROR END]------------------------------------", LOG_NOPREFIX);
}
seterrorhandler(handleError);

local g_tOriginalFunctions 	= {}; // Table that contains the original functions
//local g_tHooks				= {}; // Table containing the hooks

// Placing the original functions into the table
g_tOriginalFunctions.print 			<- 	print;
g_tOriginalFunctions.assert 		<- 	assert;

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

/*
 *	function assert (expression, strMessage)
 *
 *	Description:
 *		throws exception strMessage when the assert fails.
 *
 *	Parameter(s):
 *		<expression>	expression	- 	the expression to assert
 *		<string>		strMessage	-	the error message to be thrown
 *
 *	Return:
 *		void
 */
function assert(expression, strMessage)
{
	if (!expression)
		throw(strMessage)
}
