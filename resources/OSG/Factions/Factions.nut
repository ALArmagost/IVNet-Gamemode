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
 *  @file: Factions.nut
 *	@desc: Contains global information about factions
 *	@init-author: Jan Christophersen
 *	@date: 09.11.2013
 */

// Add our Factions, use temp vars
function tempLoadFactions ()
{
	// Note: This function is only used until we have access to mysql.
	local f1 = g_FactionManager.Add("FACTION1", 0xFF0000);
	f1.SetSpawnCoordinates(-1712.246704, 359.175751, 25.448986, 0.0); // [by Patrick] - the lost

	local f2 = g_FactionManager.Add("FACTION2", 0x00FF00);
	f2.SetSpawnCoordinates(-1246.056396, 1070.941406, 19.729691, 0.0); // [by Patrick] - yakuza

	local f3 = g_FactionManager.Add("FACTION3", 0x0000FF);
	f3.SetSpawnCoordinates(-1219.142090, 14.342171, 4.311533, 0.0); // [by Patrick] - hafen

	return true;
}