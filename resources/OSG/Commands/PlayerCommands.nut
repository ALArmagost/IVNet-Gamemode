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
 *  @file: PlayerCommands.nut
 *	@desc: contains the player commands
 *	@init-author: Jan Christophersen
 *	@date: 03.11.2013
 */

// Put all Command handlers here
function _Register (enPlayer, strPassword, iGender, iFaction)
{
	return triggerEvent("requestRegistration", enPlayer, strPassword, iGender, iFaction);
}


// Register all Commands here
// DEBUG commands
if (DEBUG_MODE)
{
	g_CommandManager.Add(["register", "reg"], USAGE("password", "gender(0: male, 1: female)", "faction (1:TB1, 2:TB2, 3:TB3)"), "_Register");
}