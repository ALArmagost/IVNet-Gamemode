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
local f1 = g_FactionManager.Add("FACTION1", 0xFF0000);
f1.SetSpawnCoordinates(166.187,367.387,15.179,90.0); // TODO

local f2 = g_FactionManager.Add("FACTION2", 0x00FF00);
f2.SetSpawnCoordinates(166.187,367.387,15.179,90.0); // TODO

local f3 = g_FactionManager.Add("FACTION3", 0x0000FF);
f3.SetSpawnCoordinates(166.187,367.387,15.179,90.0); // TODO